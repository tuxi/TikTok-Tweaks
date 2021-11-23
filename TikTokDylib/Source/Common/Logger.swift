//
//  Logger.swift
//  TikTokDylib
//
//  Created by xiaoyuan on 2021/10/30.
//

import Foundation

open class Logger {
    
    /// 日志文件的最大大小可以是KB。默认值为1024（1 MB）
    open var maxFileSize: UInt64 = 1024
    
    /// 将存储的最大日志文件数。一旦达到该点，最旧的文件将被删除。
    open var maxFileCount = 4
    
    /// 日志文件所在的目录
    open var directory = Logger.defaultDirectory() {
        didSet {
            directory = NSString(string: directory).expandingTildeInPath
            
            let fileManager = FileManager.default
            if !fileManager.fileExists(atPath: directory) {
                do {
                    try fileManager.createDirectory(atPath: directory, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    NSLog("Couldn't create directory at \(directory)")
                }
            }
        }
    }
    
    open var currentPath: String {
        return "\(directory)/\(logName(0))"
    }
    
    /// 日志文件的名称
    open var name = "logfile"
    
    /// 是否输出到控制台
    open var printToConsole = true
    
    public static let logger = Logger()
    
    lazy var queue = DispatchQueue(label: "com.objc.tiktok.Logger", qos: .default, attributes: .concurrent)
    
    /// 把内容写入到当前日志文件
    open func write(_ text: String) {
        queue.async(group: nil, flags: .barrier) {
            let path = self.currentPath
            let fileManager = FileManager.default
            if !fileManager.fileExists(atPath: path) {
                do {
                    try "".write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
                } catch _ {
                }
            }
            if let fileHandle = FileHandle(forWritingAtPath: path) {
                let writeText = text
                fileHandle.seekToEndOfFile()
                fileHandle.write(writeText.data(using: String.Encoding.utf8)!)
                fileHandle.closeFile()
                if self.printToConsole {
                    print(writeText, terminator: "")
                }
                self.cleanup()
            }
        }
    }
    /// 清理文件，当文件大小超出设定的最大值时
    func cleanup() {
        let path = "\(directory)/\(logName(0))"
        let size = fileSize(path)
        let maxSize: UInt64 = maxFileSize*1024
        if size > 0 && size >= maxSize && maxSize > 0 && maxFileCount > 0 {
            rename(0)
            //delete the oldest file
            let deletePath = "\(directory)/\(logName(maxFileCount))"
            let fileManager = FileManager.default
            do {
                try fileManager.removeItem(atPath: deletePath)
            } catch _ {
            }
        }
    }
    
    /// 检查文件大小
    func fileSize(_ path: String) -> UInt64 {
        let fileManager = FileManager.default
        let attrs: NSDictionary? = try? fileManager.attributesOfItem(atPath: path) as NSDictionary
        if let dict = attrs {
            return dict.fileSize()
        }
        return 0
    }
    
    /// 用于重命名日志文件的递归方法调用
    func rename(_ index: Int) {
        let fileManager = FileManager.default
        let path = "\(directory)/\(logName(index))"
        let newPath = "\(directory)/\(logName(index+1))"
        if fileManager.fileExists(atPath: newPath) {
            rename(index+1)
        }
        do {
            try fileManager.moveItem(atPath: path, toPath: newPath)
        } catch _ {
        }
    }
    
    ///gets the log name
    func logName(_ num :Int) -> String {
        return "\(name)-\(num).log"
    }
    
    ///get the default log directory
    class func defaultDirectory() -> String {
        var path = ""
        let fileManager = FileManager.default
#if os(iOS)
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        path = "\(paths[0])/Logs"
#elseif os(macOS)
        let urls = fileManager.urls(for: .libraryDirectory, in: .userDomainMask)
        if let url = urls.last {
            path = "\(url.path)/Logs"
        }
#endif
        if !fileManager.fileExists(atPath: path) && path != ""  {
            do {
                try fileManager.createDirectory(atPath: path, withIntermediateDirectories: false, attributes: nil)
            } catch _ {
            }
        }
        return path
    }
    
    static var dateFormat = "yyyy-MM-dd hh:mm:ssSSS"
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
}

public func logw(_ text: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
    let value = "\(Date().toString()) [\(filename))]:\(line) \(column) \(funcName) -> \(text)\n"
    Logger.logger.write(value)
}

internal extension Date {
    func toString() -> String {
        return Logger.dateFormatter.string(from: self as Date)
    }
}
