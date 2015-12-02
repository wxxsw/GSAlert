//
//  ViewController.swift
//  GSAlertExample
//
//  Created by Gesen on 15/12/1.
//  Copyright © 2015年 Gesen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tapAlert(sender: UIButton) {
        showAlert(.Alert, title: "This is Alert!", message: "some message...", sourceView: sender, actions: [
            AlertAction(title: "Cancel", type: .Cancel, handler: nil),
            AlertAction(title: "Sure", type: .Default) {
                print("I'm sure. (Alert)")
            }
        ])
    }
    
    @IBAction func tapActionSheet(sender: UIButton) {
        showAlert(.ActionSheet, title: "This is ActionSheet!", message: "some message...", sourceView: sender, actions: [
            AlertAction(title: "Cancel", type: .Cancel, handler: nil),
            AlertAction(title: "Sure", type: .Default) {
                print("I'm sure. (ActionSheet)")
            }
        ])
    }
    
}

