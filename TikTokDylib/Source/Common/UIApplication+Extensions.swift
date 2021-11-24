//
//  UIApplication+Extensions.swift
//  TikTokDylib
//
//  Created by xiaoyuan on 2021/10/11.
//

import UIKit

extension UIApplication {
    @objc var topViewController: UIViewController? {
        let clas: AnyClass? = NSClassFromString("AWEUIResponder")
        return clas?.topViewController()
    }
    
     @objc func _applicationDidFinishLaunching() {
        
         NotificationCenter.default.addObserver(self, selector: #selector(beganMotionShakeEvent), name: .init(rawValue: "UIEventSubtypexy_motionShakeNotification"), object: nil)
    }
    
    @objc func beganMotionShakeEvent() {
        if topViewController is SettingsViewController {
            topViewController?.navigationController?.popViewController(animated: true)
            return
        }
        let settingsVC = SettingsViewController()
        settingsVC.hidesBottomBarWhenPushed = true
        topViewController?.navigationController?.pushViewController(settingsVC, animated: true)
    }
}
