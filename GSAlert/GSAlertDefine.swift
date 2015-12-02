//
//  GSAlert.swift
//  GSAlert
//
//  Created by Gesen on 15/12/1.
//  Copyright © 2015年 Gesen. All rights reserved.
//

import UIKit

/**
 弹框类型
 
 - ActionSheet: 任务框
 - Alert:       提示框
 */
@objc enum AlertType: Int {
    case ActionSheet
    case Alert
}

/**
 弹框动作的类型
 
 - Default:     默认
 - Cancel:      取消
 - Destructive: 警告
 */
@objc enum AlertActionType: Int {
    case Default
    case Cancel
    case Destructive
}

/** 
 弹框动作
 */
class AlertAction: NSObject {
    
    typealias ClickHandler = (() -> Void)?
    
    /// 按钮标题
    var title: String
    
    /// 按钮类型
    var type: AlertActionType
    
    /// 按钮事件
    var handler: ClickHandler
    
    init(title: String, type: AlertActionType, handler: ClickHandler) {
        self.title = title
        self.type = type
        self.handler = handler
        super.init()
    }
}
