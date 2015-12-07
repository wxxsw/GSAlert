//
//  GSAlert7Helper.swift
//  GSAlert
//
//  Created by Gesen on 15/12/1.
//  Copyright © 2015年 Gesen. All rights reserved.
//

import UIKit

@available(iOS 7.0, *)
class BlockActionSheet: UIActionSheet, UIActionSheetDelegate, iOS7AlertProtocol {
    
    var actions: [AlertAction]!
    
    /**
     快速创建BlockActionSheet
     
     - parameter actions: 动作集合
     - parameter title:   标题
     
     - returns: BlockActionSheet
     */
    class func actionSheetWithActions(actions: [AlertAction], title: String?) -> BlockActionSheet {
        var actionSheet = BlockActionSheet()
        if let title = title { actionSheet.title = title }
        actionSheet.delegate = actionSheet
        actionSheet.setupActions(actions)
        return actionSheet
    }
    
    /**
     在某个控制中显示
     
     - parameter viewController: 控制器
     - parameter sourceView:     iPad中指向的视图（使用iPad时必须指定）
     */
    func showInViewController(viewController: UIViewController, sourceView: UIView?) {
        switch UIDevice.currentDevice().userInterfaceIdiom {
        case .Phone:
            if let tabBar = viewController.tabBarController?.tabBar {
                showFromTabBar(tabBar)
            } else {
                showInView(viewController.view)
            }
        case .Pad:
            showFromRect(sourceView!.bounds, inView: viewController.view, animated: true)
        default: break
        }
    }
    
    /**
     处理点击后的回调
     */
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        actions[buttonIndex].handler?()
    }
    
}

@available(iOS 7.0, *)
class BlockAlertView: UIAlertView, UIAlertViewDelegate, iOS7AlertProtocol {
    
    var actions: [AlertAction]!
    
    /**
     快速创建BlockAlertView
     
     - parameter actions: 动作集合
     - parameter title:   标题
     - parameter message: 内容
     
     - returns: BlockAlertView
     */
    class func alertViewWithActions(actions: [AlertAction], title: String?, message: String?) -> BlockAlertView {
        var alertView = BlockAlertView()
        alertView.title = title ?? ""
        alertView.message = message
        alertView.delegate = alertView
        alertView.setupActions(actions)
        return alertView
    }
    
    /**
     处理点击后的回调
     */
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        actions[buttonIndex].handler?()
    }
    
}

protocol iOS7AlertProtocol {
    
    var actions: [AlertAction]! { get set }
    var cancelButtonIndex: Int { get set }
    
    func addButtonWithTitle(title: String?) -> Int
    mutating func setupActions(actions: [AlertAction])
    
}

extension iOS7AlertProtocol {
    
    mutating func setupActions(actions: [AlertAction]) {
        for action in actions {
            addButtonWithTitle(action.title)
            if action.type == .Cancel {
                cancelButtonIndex = actions.indexOf(action)!
            }
        }
        self.actions = actions
    }
    
}