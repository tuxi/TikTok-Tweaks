//
//  UIApplication+Extensions.swift
//  TikTokDylib
//
//  Created by xiaoyuan on 2021/10/11.
//

import UIKit

extension UIApplication {
    struct WeakContainer {
        weak var alertController: UIAlertController?
    }
    static var weakContainer: WeakContainer?
    @objc var topViewController: UIViewController? {
        let clas: AnyClass? = NSClassFromString("AWEUIResponder")
        return clas?.topViewController()
    }
    
     @objc func _applicationDidFinishLaunching() {
        
         NotificationCenter.default.addObserver(self, selector: #selector(beganMotionShakeEvent), name: .init(rawValue: "UIEventSubtypexy_motionShakeNotification"), object: nil)
         
         DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 8) {
             self.start(isLuanching: true)
         }
    }
    
    @objc func beganMotionShakeEvent() {
        start(isLuanching: false)
    }
    
    private func start(isLuanching: Bool) {
        if (applicationState == .background ||
            applicationState == .inactive) {
            return
        }
        
        if Self.weakContainer?.alertController != nil {
            return
        }
        
        if !PreferenceManager.shared.isDebugFLEXEnabled && !isLuanching {
            return
        }
        
        let vc = UIAlertController(title: "请选择", message: nil, preferredStyle: .actionSheet)
        #if DEBUG
        vc.addAction(.init(title: "打开或关闭调试器FLEX", style: .default, handler: { action in
            UIDebuggingTool.toggleVisibility()
        }))
        #endif
        vc.addAction(.init(title: "打开设置", style: .default, handler: { [unowned self] action in
            if topViewController is SettingsViewController {
                topViewController?.navigationController?.popViewController(animated: true)
                return
            }
            let settingsVC = SettingsViewController()
            settingsVC.hidesBottomBarWhenPushed = true
            topViewController?.navigationController?.pushViewController(settingsVC, animated: true)
        }))
        vc.addAction(.init(title: "取消", style: .cancel, handler: nil))
        topViewController?.present(vc, animated: true, completion: nil)
        Self.weakContainer = WeakContainer(alertController: vc)
    }
}
