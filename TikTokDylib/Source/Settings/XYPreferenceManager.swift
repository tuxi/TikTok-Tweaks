//
//  XYPreferenceManager.swift
//  TikTokDylib
//
//  Created by xiaoyuan on 2021/10/10.
//

import Foundation

private let defaultRegionCode = "US"

@objc(XYPreferenceManager)
final class PreferenceManager: NSObject {
    @objc static let shared = PreferenceManager()
    private lazy var userDefaults = UserDefaults.standard
    
    enum Keys: String, CaseIterable {
        case unlimitedDownload
        case skipAds
        case autoPlayNextVideoWhenPlayEnded
        case showProgressBar
        case countryCode
        case pureMode
        case autoPlayNextVideoWhenPlayLiveRoom
        case debugFLEX
        
        var key: String {
            return "com.aweme.objc." + self.rawValue
        }
        
    }
    
    /// 是否开启无限制下载原版视频, 默认为 false 不移除
    @objc var isUnlimitedDownload: Bool = true {
        didSet {
            userDefaults.set(isUnlimitedDownload, forKey: Keys.unlimitedDownload.rawValue)
            userDefaults.synchronize()
        }
    }
    
    /// 是否播放广告，默认true
    @objc var shouldPlayAds: Bool = true {
        didSet {
            userDefaults.set(shouldPlayAds, forKey: Keys.skipAds.rawValue)
            userDefaults.synchronize()
        }
    }
    
    /// 播放完成后自动播放下一个，默认为true
    @objc var isAutoPlayNextVideoWhenPlayEnded: Bool = true {
        didSet {
            userDefaults.set(isAutoPlayNextVideoWhenPlayEnded, forKey: Keys.autoPlayNextVideoWhenPlayEnded.rawValue)
            userDefaults.synchronize()
        }
    }
    
    /// 播放直播时自动播放下一个，默认为true
    @objc var isAutoPlayNextVideoWhenPlayLiveRoom: Bool = true {
        didSet {
            userDefaults.set(isAutoPlayNextVideoWhenPlayLiveRoom, forKey: Keys.autoPlayNextVideoWhenPlayLiveRoom.rawValue)
            userDefaults.synchronize()
        }
    }
    
    /// 是否一直显示播放的进度条，默认false
    @objc var showProgressBar: Bool = false {
        didSet {
            userDefaults.set(showProgressBar, forKey: Keys.showProgressBar.rawValue)
            userDefaults.synchronize()
        }
    }
    
    /// 当前的国家code，会按照国家code设置mnc，默认为日本
    @objc var countryCode: String = defaultRegionCode {
        didSet {
            userDefaults.set(countryCode, forKey: Keys.countryCode.rawValue)
            userDefaults.synchronize()
        }
    }
    
    /// 是否开启纯模式，在首页播放时只会显示视频哦，隐藏文本和头像
    @objc var isPureMode: Bool = false {
        didSet {
            userDefaults.set(isPureMode, forKey: Keys.pureMode.rawValue)
            userDefaults.synchronize()
            if isPureMode != oldValue {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "xyNeedsSetPureModeNotification"), object: nil)
            }
        }
    }
    
    /// debug flex
    @objc var isDebugFLEXEnabled: Bool = false {
        didSet {
            let value = isDebugFLEXEnabled == true ? 2 : 1
            userDefaults.set(value, forKey: Keys.debugFLEX.rawValue)
            userDefaults.synchronize()
        }
    }
    
    @objc var carriers: [Carrier] = []
    
    @objc var currentCarrier: Carrier {
        let carrier = self.carriers.first { obj in
            return obj.code.lowercased() == countryCode.lowercased()
        }
        return carrier!
    }
    
    private override init() {
        super.init()
        carriers = readCarriers()
        
        Keys.allCases.forEach { key in
            switch key {
            case .unlimitedDownload:
                isUnlimitedDownload = (userDefaults.object(forKey: key.rawValue) as? NSNumber)?.boolValue ?? true
            case .skipAds:
                shouldPlayAds = (userDefaults.object(forKey: key.rawValue) as? NSNumber)?.boolValue ?? true
            case .autoPlayNextVideoWhenPlayEnded:
                isAutoPlayNextVideoWhenPlayEnded = (userDefaults.object(forKey: key.rawValue) as? NSNumber)?.boolValue ?? true
            case .showProgressBar:
                showProgressBar = (userDefaults.object(forKey: key.rawValue) as? NSNumber)?.boolValue ?? false
            case .countryCode:
                countryCode = userDefaults.string(forKey: key.rawValue) ?? defaultRegionCode
            case .pureMode:
                isPureMode = userDefaults.bool(forKey: key.rawValue)
            case .autoPlayNextVideoWhenPlayLiveRoom:
                isAutoPlayNextVideoWhenPlayLiveRoom = userDefaults.bool(forKey: key.rawValue)
            case .debugFLEX:
                let value = userDefaults.integer(forKey: key.rawValue)
                if value == 2 {
                    isDebugFLEXEnabled = true
                } else if value == 1 {
                    isDebugFLEXEnabled = false
                } else {
                    isDebugFLEXEnabled = true
                }
            }
        }
    }
    
    private func readCarriers() -> [Carrier] {
        guard let path = Bundle.main.path(forResource: "countryCode", ofType: "plist") else {
            return []
        }
        let dictArray = NSArray(contentsOfFile: path) ?? []
        guard let data = try? JSONSerialization.data(withJSONObject: dictArray, options: .fragmentsAllowed) else {
            return []
        }
        let decoder = JSONDecoder()
        guard let models = try? decoder.decode([Carrier].self, from: data) else {
            return []
        }
        return models
    }
}
