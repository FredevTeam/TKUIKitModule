//
//  UIButtonViewController.swift
//  TKUIKitModule_Example
//
//  Created by 聂子 on 2019/3/4.
//  Copyright © 2019年 CocoaPods. All rights reserved.
//

import UIKit
import TKUIKitModule

class UIButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.ui.randomColor
        let button = UIButton.ui.create(title: "test", style: { (button) in
            button.backgroundColor = UIColor.ui.randomColor
            button.frame = CGRect.init(x: 0, y: 100, width: 200, height: 50)
        }) { (button) in
            print("action")
        }
        // 创建
        view.addSubview(button)
        
        UIButton.ui.create { (button) in
            
            }.then { (button) in
                
        }
    }
}
