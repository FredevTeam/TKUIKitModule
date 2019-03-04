//
//  UIButton+Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation


extension UIButton {
    public func contentEdgeInsets(_ value: UIEdgeInsets) -> Self {
        contentEdgeInsets = value
        return self
    }
    public func titleEdgeInsets(_ value: UIEdgeInsets) -> Self {
        titleEdgeInsets = value
        return self
    }
    
    public func imageEdgeInsets(_ value: UIEdgeInsets) -> Self {
        imageEdgeInsets = value
        return self
    }
    
    public func adjustsImageWhenHighlighted(_ value: Bool) -> Self {
        adjustsImageWhenHighlighted = value
        return self
    }
    public func adjustsImageWhenDisabled(_ value: Bool) -> Self {
        adjustsImageWhenDisabled = value
        return self
    }
    
    public func showsTouchWhenHighlighted(_ value: Bool) -> Self {
        showsTouchWhenHighlighted = value
        return self
    }
    
    
    public func tintColor(_ value: UIColor) -> Self {
        tintColor = value
        return self
    }
    
    public func setTitle(_ value: String, state: UIControlState) -> Self {
        setTitle(value, for: state)
        return self
    }
    public func setTitleColor(_ value: UIColor, state: UIControlState) -> Self {
        setTitleColor(value, for: state)
        return self
    }
    
    public func setImage(_ value: UIImage, state: UIControlState) -> Self {
        setImage(value, for: state)
        return self
    }
    public func titleShadowColor(_ value: UIColor, state: UIControlState) -> Self {
        setTitleShadowColor(value, for: state)
        return self
    }
    public func backgroundImage(_ image: UIImage, state: UIControlState) -> Self {
        setBackgroundImage(image, for: state)
        return self
    }
    
    public func attributedTitle(_ attr: NSAttributedString, state: UIControlState) -> Self {
        setAttributedTitle(attr, for: state)
        return self
    }
    public func target(_ target: AnyObject?, action: Selector, forControlEvents: UIControlEvents) -> Self {
        addTarget(target, action: action, for: forControlEvents)
        return self
    }
    public func target(for controlEvents: UIControlEvents,_ block:@escaping ((_ sender:UIButton?) -> Void)) -> Self  {
        self.block = block
        self.addTarget(self, action: #selector(self.buttonAction), for: controlEvents)
        return self
    }
}
