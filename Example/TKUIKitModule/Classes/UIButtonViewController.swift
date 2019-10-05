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
        view.backgroundColor = UIColor.white
        view.backgroundColor = UIColor.ui.randomColor
        let button = UIButton.ui.create(title: "test", style: { (button) in
            button.backgroundColor = UIColor.ui.randomColor
            button.frame = CGRect.init(x: 0, y: 100, width: 200, height: 50)
        }) { (button) in
            print("action")
        }
        // 创建
        view.addSubview(button)
        
//        UIButton.ui.create { (button) in
//            
//            }.then { (button) in
//                
//        }
        createTimerIntervalButton()
    }
}

extension UIButtonViewController {
    func createTimerIntervalButton() {
        let button = UIButton.init(type: .custom)
        button.setTitle("TimerInterval", for: .normal)
        button.frame = CGRect.init(x: 100, y: 100, width: 200, height: 50)
        button.eventInterval = 3
        button.backgroundColor = UIColor.ui.randomColor
        button.addTarget(self , action: #selector(timerIntervalButtonAction), for: .touchUpInside)
        view.addSubview(button)

        let button2 = UIButton.init(type: .custom)
        button2.setTitle("TimerInterval2", for: .normal)
        button2.frame = CGRect.init(x: 100, y: 200, width: 200, height: 50)
        button2.eventInterval = 10
        button2.backgroundColor = UIColor.ui.randomColor
        button2.addTarget(self , action: #selector(timerIntervalButtonAction2), for: .touchUpInside)
        view.addSubview(button2)
    }
}


extension UIButtonViewController {
    @objc func timerIntervalButtonAction() {
        debugPrint("=================")
    }

    @objc func timerIntervalButtonAction2() {
        debugPrint("===========2======")
    }
}
