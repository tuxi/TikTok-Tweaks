//
//  VideoDownloader.swift
//  TikTokDylib
//
//  Created by xiaoyuan on 2021/10/11.
//

import Foundation
import Photos

@objc(XYVideoDownloader)
class VideoDownloader: NSObject {
    
    typealias Completion = (Bool, Error?) -> Void
    
    @objc static let shared = VideoDownloader()
    
    private var session: URLSession!
    private var completionHandler: Completion?
    private var hud: MBProgressHUD?
    private var currentTask: URLSessionDownloadTask?
    private var tasks: [URLSessionDownloadTask]?
    private var lastError: Error?
    
    private override init() {
        
        super.init()
        session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: .main)
    }
    
    @objc func download(withURLs urls: [URL], completion: @escaping Completion) {
        DispatchQueue.main.async {
            let window = UIApplication.shared.delegate!.window!!
            self.hud = MBProgressHUD.showAdded(to: window, animated: true)
            self.hud?.bezelView.backgroundColor = .black.withAlphaComponent(0.65)
            self.hud?.bezelView.style = .solidColor
            self.hud?.label.text = "准备下载"
            self.hud?.label.font = UIFont.systemFont(ofSize: 12)
            self.hud?.button.setTitle("取消", for: .normal)
            self.hud?.button.heightAnchor.constraint(equalToConstant: 15.0).isActive = true
            self.hud?.button.widthAnchor.constraint(equalToConstant: 45.0).isActive = true
            self.hud?.button.addTarget(self, action: #selector(self.cancelAction), for: .touchUpInside)
            self.hud?.button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        }
        completionHandler = completion
        cancelAction()
        let tasks = urls.map { url -> URLSessionDownloadTask in
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            return session.downloadTask(with: request)
        }
        self.tasks = tasks
        downloadNext()
    }
    
    ///通过url下载
    @objc func download(withURL url: URL, completion: @escaping Completion) {
        download(withURLs: [url], completion: completion)
    }
    
    private func downloadNext() {
        if var tasks = tasks, !tasks.isEmpty {
            currentTask = tasks.removeFirst()
            currentTask?.resume()
            self.tasks = tasks
        } else {
            if let error = lastError {
                completionHandler?(false, error)
            } else {
                completionHandler?(true, nil)
            }
            self.hud?.hide(animated: true, afterDelay: 0.5)
        }
        
    }
    
    private func setHUDLabel(_ text: String) {
        self.hud?.label.text = text
    }
    
    @objc private func cancelAction() {
        if currentTask?.state == .running {
            currentTask?.cancel()
        }
        tasks?.filter { $0.state == .running }.forEach { $0.cancel() }
    }
}

extension VideoDownloader {
    
    /// 保存相册到视频完成后的回调
    @objc private func video(_ path: String, didFinishSavingWithError error: Error?, contextInfo info: AnyObject) {
        self.saveCompletionHandler(file: URL(fileURLWithPath: path), error: error)
    }
    
    func saveCompletionHandler(file: URL, error: Error?) {
        DispatchQueue.main.async {
            do {
                try FileManager.default.removeItem(at: file)
            } catch let e {
                print("移除文件失败: \(e.localizedDescription)")
            }
            
            if let error = error {
                self.setHUDLabel("保存到相册失败: \(error.localizedDescription)")
                self.lastError = error
                // 下载下一个
                self.downloadNext()
                return
            }
            
            self.setHUDLabel("已保存到相册！")
           
            if #available(iOS 10.0, *) {
                let feedback = UIImpactFeedbackGenerator(style: .medium)
                feedback.impactOccurred()
            }
            
            // 下载下一个
            self.downloadNext()
        }
        
    }
    
    func saveFile(file: URL) {
        // 保存到相册
        /*
         iOS相册支持GIF 和APNG 的保存 目测iOS11.0在相册中也可以播放GIF 的动态图.而iOS8.3不能.
         writeImageDataToSavedPhotosAlbum 可以直接将其写入相册
         UIImageWriteToSavedPhotosAlbum() 图像强制转码为PNG
         */
        let fileExtension = file.pathExtension.lowercased()
        if fileExtension == "webp" || fileExtension == "gif" {
            PHPhotoLibrary.shared().performChanges {
                PHAssetCreationRequest().addResource(with: .photo, fileURL: file, options: nil)
            } completionHandler: { [weak self] isSuccess, error in
                self?.saveCompletionHandler(file: file, error: error)
            }

        } else if fileExtension == "mp3" {
            // 音频需要转换为视频后才能存储到相册
            MediaExportSession.exportAudio(file: file) { result in
                switch result {
                case .success(let outFileURL):
                    UISaveVideoAtPathToSavedPhotosAlbum(outFileURL.path, self, #selector(self.video(_:didFinishSavingWithError:contextInfo:)), nil)
                case .failure(let error):
                    self.saveCompletionHandler(file: file, error: error)
                }
            }
        } else {
            UISaveVideoAtPathToSavedPhotosAlbum(file.path, self, #selector(self.video(_:didFinishSavingWithError:contextInfo:)), nil)
        }
    }
}

extension VideoDownloader: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let fileManeger = FileManager.default
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let fileExtension = (downloadTask.response?.suggestedFilename ?? "\(Date().timeIntervalSince1970)")
        let path = documents + "/" + fileExtension
        let fileURL = URL(fileURLWithPath: path)
        do {
            try fileManeger.moveItem(at: location, to: fileURL)
            saveFile(file: fileURL)
            self.setHUDLabel("正在保存到相册！")
        } catch {
            setHUDLabel("下载视频失败: \(error.localizedDescription)")
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
     
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        let value = Int(progress * 100)
        self.setHUDLabel(String(format: "下载进度: %ld%%", value))
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            if (error as NSError).code == NSURLErrorCancelled {
                self.setHUDLabel("已取消")
            } else {
                self.setHUDLabel("视频下载失败: \(error.localizedDescription)")
            }
            self.lastError = error
        }
        // 下载下一个
        downloadNext()
    }
}
