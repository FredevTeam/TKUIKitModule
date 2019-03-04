//
//  UIViewViewController.swift
//  TKUIKitModule_Example
//
//  Created by 聂子 on 2019/3/3.
//  Copyright © 2019年 CocoaPods. All rights reserved.
//

import UIKit
import TKUIKitModule

class UIViewViewController: UIViewController {

    private var containterView: UIView = UIView.init()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containterView.frame = CGRect.init(x: 0, y: 100, width: view.frame.width, height: 100)
        
        let button = UIButton.init(type: .custom)
        button.backgroundColor = UIColor.ui.randomColor
        button.setTitle("test_removeAllSubviews", for: .normal)
        button.addTarget(self, action: #selector(test_removeAllSubviews), for: .touchUpInside)
        button.frame = CGRect.init(x: 0, y: containterView.maxY, width: containterView.width, height: 50)
        view.addSubview(button)
    }
}

extension UIViewViewController {
   @objc private func test_removeAllSubviews() {
        for _ in 0...4 {
            let view = UIView.init()
            view.backgroundColor = UIColor.ui.randomColor
            view.frame = containterView.bounds
            containterView.addSubview(view)
        }
        assert(containterView.subviews.count > 0)
        containterView.ui.removeAllSubview()
        assert(containterView.subviews.count == 0)
    }
    private func test_removeAllGesture() {
        for _ in 0...3 {
            let gest = UITapGestureRecognizer.init(target: self, action: #selector(gestAction))
            containterView.addGestureRecognizer(gest)
        }
        assert(containterView.gestureRecognizers?.count ?? 0 > 0)
        containterView.ui.removeAllGesture()
        assert(containterView.gestureRecognizers?.count == 0)
    }
    private func test_topView() {
        
    }
}


extension UIViewViewController {
    @objc private func gestAction() {
        
    }
}
