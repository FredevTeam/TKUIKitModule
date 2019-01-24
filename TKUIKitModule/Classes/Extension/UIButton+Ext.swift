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
    public static func create(title: String?,event: UIControlEvents? = .touchUpInside, block:((_ sender:UIButton?) -> Void)?) -> UIButton {
        return UIButton.tk.create(title: title, image: nil,backImage: nil, event: event, block: block)
    }
    
    /// 通过 image 创建button
    ///
    /// - Parameters:
    ///   - image: image
    ///   - event: event
    ///   - block:  action block
    /// - Returns: button
    public static func create(with image: UIImage?,event: UIControlEvents? = .touchUpInside,block:((_ sender:UIButton?) -> Void)?)-> UIButton {
        return UIButton.tk.create(title: nil , image: image,backImage: nil, event: event, block: block)
    }
    
    /// 通过 back  image 创建button
    ///
    /// - Parameters:
    ///   - image: back  image
    ///   - event: event
    ///   - block: action block
    /// - Returns: button
    public static func create(back image: UIImage?,event: UIControlEvents? = .touchUpInside,block:((_ sender:UIButton?) -> Void)?)-> UIButton {
        return UIButton.tk.create(title: nil, image: nil, backImage: image, event: event, block: block)
    }
    
    /// 通过 title image 创建button
    ///
    /// - Parameters:
    ///   - title: title
    ///   - image: image
    ///   - event: event
    ///   - block: action block
    /// - Returns: button
    public static func create(title: String?, image: UIImage?,backImage: UIImage?,event:UIControlEvents? = .touchUpInside, block:((_ sender:UIButton?) -> Void)?) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.setTitle(title, for: .normal)
        button.block = block
        button.addTarget(self, action: #selector(button.buttonAction), for: event ?? .touchUpInside)
        button.sizeToFit()
        return button
    }
    
    
    
    
    
}
