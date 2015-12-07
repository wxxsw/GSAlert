//
//  GSAlert8Helper.swift
//  GSAlert
//
//  Created by Gesen on 15/12/2.
//  Copyright © 2015年 Gesen. All rights reserved.
//

import UIKit

@available(iOS 8.0, *)
extension UIAlertController {
    
    /**
     快速创建UIAlertController
     
     - parameter type:       Alert/ActionSheet
     - parameter title:      标题
     - parameter message:    内容
     - parameter sourceView: iPad指向的视图（使用iPad时必须指定）
     - parameter actions:    动作集合
     
     - returns: UIAlertController
     */
    class func alertWithType(type: AlertType, title: String?, message: String?, sourceView: UIView?, actions: [AlertAction]) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle(rawValue: type.rawValue)!)
        
        for action in actions {
            alert.addAction(UIAlertAction(title: action.title, style: UIAlertActionStyle(rawValue: action.type.rawValue)!, handler: { _ in
                action.handler?()
            }))
        }
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            alert.popoverPresentationController?.sourceView = sourceView!
            alert.popoverPresentationController?.sourceRect = sourceView!.bounds
        }
        
        return alert
    }
    
    /**
     在主控制器上弹框，便捷方法
     */
    func show() { present(animated: true, completion: nil) }
    
    /**
     在主控制器上弹框，带参数
     
     - parameter animated:   是否使用动画
     - parameter completion: 完成的回调
     */
    func present(animated animated: Bool, completion: (() -> Void)?) {
        if let rootVC = UIApplication.sharedApplication().keyWindow?.rootViewController {
            presentFromController(rootVC, animated: animated, completion: completion)
        }
    }
    
    /**
     递归从合适的控制器上弹框
     
     - parameter controller: 待定的控制器
     - parameter animated:   是否使用动画
     - parameter completion: 完成的回调
     */
    private func presentFromController(controller: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if let navVC = controller as? UINavigationController, visibleVC = navVC.visibleViewController {
            presentFromController(visibleVC, animated: animated, completion: completion)
        } else if let tabVC = controller as? UITabBarController, selectedVC = tabVC.selectedViewController {
            presentFromController(selectedVC, animated: animated, completion: completion)
        } else {
            controller.presentViewController(self, animated: animated, completion: completion)
        }
    }
}