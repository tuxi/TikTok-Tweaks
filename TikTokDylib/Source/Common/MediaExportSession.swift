//
//  MediaExportSession.swift
//  Aweme
//
//  Created by xiaoyuan on 2023/4/18.
//

import Foundation
import AVFoundation

enum MediaExportError: Error {
    case emptyTracks
}

struct MediaExportSession {
    // 音频保存到相册前 需要把音频转换为无画面的mp4文件后，才能存储到相册
    static func exportAudio(file: URL, result: @escaping (Result<URL, Error>) -> Void) {
        // 获取媒体信息，声音
        let audioAsset = AVURLAsset(url: file, options: nil)
        
        let mixComposition = AVMutableComposition()
        
        let audioTime = audioAsset.duration
        // 音频的长度
        let seconds = CMTimeGetSeconds(audioTime)
        
//        //开始位置startTime
//        let startTime = CMTimeMakeWithSeconds(0, preferredTimescale: audioAsset.duration.timescale)
        //截取长度videoDuration
        let videoDuration = CMTimeMakeWithSeconds(seconds, preferredTimescale: audioAsset.duration.timescale)
        
       
        //声音长度截取范围
        let audioTimeRange = CMTimeRangeMake(start: .zero, duration: videoDuration)
        
        
        //视频采集compositionVideoTrack 以音频为主
        let compositionAudioTrack = mixComposition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
        
        // 导出文件
        let exportCallBack: (AVAssetTrack) -> () = { track in
            do {
                try compositionAudioTrack?.insertTimeRange(audioTimeRange, of: track, at: .zero)
                
                //AVAssetExportSession用于合并文件，导出合并后文件，presetName文件的输出类型
                let assetExportSession = AVAssetExportSession(asset: mixComposition, presetName: AVAssetExportPresetPassthrough)
                
                let dir = NSTemporaryDirectory()
                var lastPathComponent = file.lastPathComponent
                if lastPathComponent.hasSuffix(".mp3") {
                    let startIndex = lastPathComponent.index(lastPathComponent.startIndex, offsetBy: lastPathComponent.count - 4)
                    lastPathComponent.replaceSubrange(startIndex..<lastPathComponent.endIndex, with: ".mp4")
                }
                let outPutPath = dir + lastPathComponent
                //混合后的视频输出路径
                let outPutUrl = URL(fileURLWithPath: outPutPath)
                if FileManager.default.fileExists(atPath: outPutPath) {
                    try FileManager.default.removeItem(at: outPutUrl)
                }
                
                // 输出视频格式 AVFileTypeMPEG4
                assetExportSession?.outputFileType = .mp4
                assetExportSession?.outputURL = outPutUrl
                // 输出文件是否网络优化
                assetExportSession?.shouldOptimizeForNetworkUse = true
                assetExportSession?.exportAsynchronously {
                    DispatchQueue.main.async {
                        result(.success(outPutUrl))
                    }
                }
            } catch let error {
                result(.failure(error))
            }
        }
        
       
        if #available(iOS 15.0, *) {
            audioAsset.loadTracks(withMediaType: .audio) { tracks, error in
                guard let tracks = tracks, !tracks.isEmpty else {
                    DispatchQueue.main.async {
                        result(.failure(MediaExportError.emptyTracks))
                    }
                    return
                }
                exportCallBack(tracks[0])
            }
        } else {
            let audioTracks = audioAsset.tracks(withMediaType: .audio)
            if audioTracks.isEmpty {
                DispatchQueue.main.async {
                    result(.failure(MediaExportError.emptyTracks))
                }
            } else {
                exportCallBack(audioTracks[0])
            }
        }
    }
}
