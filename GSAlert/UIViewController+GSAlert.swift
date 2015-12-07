//
//  UIViewController+GSAlert.swift
//  GSAlert
//
//  Created by Gesen on 15/12/1.
//  Copyright © 2015年 Gesen. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /**
     显示提示框
     
     - parameter type:       ActionSheet/Alert
     - parameter title:      标题
     - parameter message:    内容
     - parameter sourceView: iPad中，弹窗指向的View
     - parameter actions:    动作数组
     */
    func showAlert(type: AlertType, title: String?, message: String?, sourceView: UIView?, actions: [AlertAction]) {
        
        if #available(iOS 8.0, *) {
            
            let alert = UIAlertController.alertWithType(type, title: title, message: message, sourceView: sourceView, actions: actions)
            presentViewController(alert, animated: true, completion: nil)
            
        } else {
            
            switch type {
            case .ActionSheet: BlockActionSheet.actionSheetWithActions(actions, title: title).showInViewController(self, sourceView: sourceView)
            case .Alert: BlockAlertView.alertViewWithActions(actions, title: title, message: message).show()
            }
            
        }
        
    }
    
}
