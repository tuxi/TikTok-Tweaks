//
//  Carrier.swift
//  TikTokDylib
//
//  Created by xiaoyuan on 2021/10/10.
//

import Foundation

@objc(XYCarrier)
@objcMembers class Carrier: NSObject, Codable {
    var area: String
    var code: String
    var mcc: String
    var mnc: String
    
    init(area: String, code: String, mcc: String, mnc: String) {
        self.area = area
        self.code = code
        self.mcc = mcc
        self.mnc = mnc
        super.init()
    }
}
