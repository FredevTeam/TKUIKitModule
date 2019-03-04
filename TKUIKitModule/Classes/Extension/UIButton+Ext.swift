//
//  UIButton+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/8.
//

import Foundation

fileprivate var kActionBlock = "UIButtonActionBlock"
extension UIButton {
    var block:((_ sender:UIButton?) -> Void)?
    {
        get {
            return (objc_getAssociatedObject(self, &kActionBlock) as? (UIButton?) -> Void)
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kActionBlock, newValue, .OBJC_ASSOCIATION_COPY)
        }
    }
    @objc func buttonAction() {
        if !self.isEnabled {
            return
        }
        self.isEnabled = false
        self.block?(self)
        self.isEnabled = true
    }
}

extension TypeWrapperProtocol where WrappedType == UIButton {
    /// 通过 title 创建button
    ///
    /// - Parameters:
    ///   - title: title
    ///   - event: 事件类型
    ///   - block: 事件block
    /// - Returns: button
    public static func create(title: String? = nil,event: UIControlEvents? = .touchUpInside,style:((_ sender: UIButton) -> Void)? = nil, block:((_ sender:UIButton?) -> Void)?) -> UIButton {
        return UIButton.ui.create(title: title, image: nil, backImage: nil, event: event, style: style, block: block)
    }
    
    /// 通过 image 创建button
    ///
    /// - Parameters:
    ///   - image: image
    ///   - event: event
    ///   - block:  action block
    /// - Returns: button
    public static func create(image: UIImage?,event: UIControlEvents? = .touchUpInside,style:((_ sender: UIButton)-> Void)? = nil,block:((_ sender:UIButton?) -> Void)?)-> UIButton {
        return UIButton.ui.create(title: nil, image: image, backImage: nil, event: event, style: style, block: block)
    }
    
    /// 通过 back  image 创建button
    ///
    /// - Parameters:
    ///   - image: back  image
    ///   - event: event
    ///   - block: action block
    /// - Returns: button
    public static func create(back image: UIImage?,event: UIControlEvents? = .touchUpInside,style:((_ sender: UIButton)-> Void)? = nil,block:((_ sender:UIButton?) -> Void)?)-> UIButton {
        return UIButton.ui.create(title: nil, image: nil, backImage: image, event: event, style: style, block: block)
    }
    
    /// 通过 title image 创建button
    ///
    /// - Parameters:
    ///   - title: title
    ///   - image: image
    ///   - event: event
    ///   - style: 样式设置
    ///   - block: action block
    /// - Returns: button
    public static func create(title: String?, image: UIImage?,backImage: UIImage?,event:UIControlEvents? = .touchUpInside,style:((_ sender: UIButton)-> Void)? = nil, block:((_ sender:UIButton?) -> Void)?) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.setTitle(title, for: .normal)
        style?(button)
        button.block = block
        button.addTarget(self, action: #selector(button.buttonAction), for: event ?? .touchUpInside)
        button.sizeToFit()
        return button
    }
    
    
    
    
    
}
