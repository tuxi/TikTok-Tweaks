//
//  VideoDownloader.swift
//  TikTokDylib
//
//  Created by xiaoyuan on 2021/10/11.
//

import Foundation

@objc(XYVideoDownloader)
class VideoDownloader: NSObject {
    
    typealias Completion = (Bool, Error?) -> Void
    
    @objc static let shared = VideoDownloader()
    
    private var session: URLSession!
    private var completionHandler: Completion?
    private var hud: MBProgressHUD?
    private var currentTask: URLSessionDownloadTask?
    
    private override init() {
        
        super.init()
        session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: .main)
    }
    
    ///通过url下载
    @objc func download(withURL url: URL, completion: @escaping Completion) {
        completionHandler = completion
        if let currentTask = currentTask {
            currentTask.cancel()
        }
        
         let window = UIApplication.shared.delegate!.window!!
        hud = MBProgressHUD.showAdded(to: window, animated: true)
        hud?.bezelView.backgroundColor = .black.withAlphaComponent(0.65)
        hud?.bezelView.style = .solidColor
        hud?.label.text = "准备下载"
        hud?.label.font = UIFont.systemFont(ofSize: 12)
        hud?.button.setTitle("取消", for: .normal)
        hud?.button.heightAnchor.constraint(equalToConstant: 15.0).isActive = true
        hud?.button.widthAnchor.constraint(equalToConstant: 45.0).isActive = true
        hud?.button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        hud?.button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
       
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        currentTask = session.downloadTask(with: request)
        currentTask?.resume()
    }
    
    private func setHUDLabel(_ text: String) {
        self.hud?.label.text = text
    }
    
    @objc private func cancelAction() {
        if currentTask?.state == .running {
            currentTask?.cancel()
        }
    }
}

extension VideoDownloader {
    
    /// 保存相册到视频完成后的回调
    @objc private func video(_ path: String, didFinishSavingWithError error: Error?, contextInfo info: AnyObject) {
        do {
            try FileManager.default.removeItem(atPath: path)
        } catch let e {
            print("移除文件失败: \(e.localizedDescription)")
        }
        self.hud?.hide(animated: true, afterDelay: 0.5)
        if let error = error {
            self.setHUDLabel("保存到相册失败: \(error.localizedDescription)")
            self.completionHandler?(false, error)
            return
        }
        
        self.setHUDLabel("已保存到相册！")
        self.completionHandler?(true, nil)
        if #available(iOS 10.0, *) {
            let feedback = UIImpactFeedbackGenerator(style: .medium)
            feedback.impactOccurred()
        }
    }
}

extension VideoDownloader: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let fileManeger = FileManager.default
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let path = documents + "/" + (downloadTask.response?.suggestedFilename ?? "\(Date().timeIntervalSince1970)")
        do {
            try fileManeger.moveItem(at: location, to: URL(fileURLWithPath: path))
            // 保存到相册
            UISaveVideoAtPathToSavedPhotosAlbum(path, self, #selector(self.video(_:didFinishSavingWithError:contextInfo:)), nil)
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
            self.hud?.hide(animated: true, afterDelay: 0.5)
            completionHandler?(false, error)
        }
    }
}
