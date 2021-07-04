//
//  UIButton+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/8.
//

import Foundation


extension UIButton {
    private struct AssociatedBlockKey {
        static var kActionBlock = "UIButtonActionBlock"
    }
    var block:((_ sender:UIButton?) -> Void)?
    {
        get {
            return (objc_getAssociatedObject(self, &AssociatedBlockKey.kActionBlock) as? (UIButton?) -> Void)
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedBlockKey.kActionBlock, newValue, .OBJC_ASSOCIATION_COPY)
        }
    }
    @objc func buttonAction() {
        if self.canEvent {
            self.canEvent = false
            self.block?(self)
            self.perform(#selector(updateCanEvent), with: NSNumber.init(value: true), afterDelay: self.eventInterval)
        }
    }
}

// MARK: - UIButton EventInterval
extension UIButton {
    private struct AssociatedIntervalKey {
        static var timerIntervalKey = "timerIntervalKey"
        static var canEventKey = "canEventKey"
        static var methodSwizzingKey = "methodSwizzingKey"
    }

    /// 事件间隔
    public var eventInterval: TimeInterval {
        get {
            return (objc_getAssociatedObject(self, &AssociatedIntervalKey.timerIntervalKey) as? TimeInterval) ?? 0.0
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedIntervalKey.timerIntervalKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
            if !UIButton.methodSwizzing {
                methodSwizzingAction()
            }
        }
    }
    @objc var canEvent: Bool {
        get {
            return (objc_getAssociatedObject(self, &AssociatedIntervalKey.canEventKey) as? Bool) ?? true
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedIntervalKey.canEventKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    @objc static var methodSwizzing: Bool {
        get {
            return (objc_getAssociatedObject(self, &AssociatedIntervalKey.methodSwizzingKey) as? Bool) ?? false
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedIntervalKey.methodSwizzingKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }

    @objc func tk_sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        if self.canEvent {
            self.canEvent = false
            self.tk_sendAction(action, to: target, for: event)
            self.perform(#selector(updateCanEvent), with: NSNumber.init(value: true), afterDelay: self.eventInterval)
        }
    }
    @objc private func updateCanEvent() {
        self.canEvent = true
    }

    private func methodSwizzingAction() {
        DispatchQueue.once(UUID.init().uuidString + "Button_TimeInterval") {
            // 方法交换
            UIView.swizzling(UIButton.self, originalSelector: #selector(sendAction(_:to:for:)), swizzledSelector: #selector(tk_sendAction(_:to:for:)))
            UIButton.methodSwizzing = true
        }
    }
}




// MARK: - UIButton create
extension TypeWrapperProtocol where WrappedType : UIButton {
    /// 通过 title 创建button
    ///
    /// - Parameters:
    ///   - title: title
    ///   - event: 事件类型
    ///   - block: 事件block
    /// - Returns: button
    public static func create(title: String?,event: UIControl.Event = .touchUpInside,style:((_ sender: UIButton) -> Void)?, block:((_ sender:UIButton?) -> Void)?) -> UIButton {
        return UIButton.ui.create(title: title, image: nil, backImage: nil, event: event, style: style, block: block)
    }
    
    /// 通过 image 创建button
    ///
    /// - Parameters:
    ///   - image: image
    ///   - event: event
    ///   - block:  action block
    /// - Returns: button
    public static func create(image: UIImage?,event: UIControl.Event = .touchUpInside,style:((_ sender: UIButton)-> Void)?,block:((_ sender:UIButton?) -> Void)?)-> UIButton {
        return UIButton.ui.create(title: nil, image: image, backImage: nil, event: event, style: style, block: block)
    }
    
    /// 通过 back  image 创建button
    ///
    /// - Parameters:
    ///   - image: back  image
    ///   - event: event
    ///   - block: action block
    /// - Returns: button
    public static func create(back image: UIImage?,event: UIControl.Event = .touchUpInside,style:((_ sender: UIButton)-> Void)?,block:((_ sender:UIButton?) -> Void)?)-> UIButton {
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
    public static func create(title: String?, image: UIImage?,backImage: UIImage?,event:UIControl.Event = .touchUpInside,style:((_ sender: UIButton)-> Void)?, block:((_ sender:UIButton?) -> Void)?) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.setTitle(title, for: .normal)
        style?(button)
        button.block = block
        button.addTarget(self, action: #selector(button.buttonAction), for: event)
        button.sizeToFit()
        return button
    }
}
