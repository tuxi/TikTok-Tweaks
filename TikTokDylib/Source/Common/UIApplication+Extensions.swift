//
//  UIApplication+Extensions.swift
//  TikTokDylib
//
//  Created by xiaoyuan on 2021/10/11.
//

import UIKit

extension UIApplication {
    var topViewController: UIViewController? {
        let clas: AnyClass? = NSClassFromString("AWEUIResponder")
        return clas?.topViewController()
    }
}
