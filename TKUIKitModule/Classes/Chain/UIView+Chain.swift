//
//  UIView+Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation

extension UIView {
    public func frame(_ value: CGRect) -> Self {
        frame = value
        return self
    }
    public func userInteractionEnabled(_ value: Bool) -> Self {
        isUserInteractionEnabled = value
        return self
    }
    
    public func bounds(_ value: CGRect) -> Self {
        bounds = value
        return self
    }
    
    public func backgroundColor(_ value: UIColor) -> Self {
        backgroundColor = value
        return self
    }
    
    public func hidden(_ value: Bool) -> Self {
        isHidden = value
        return self
    }
    
    public func tag(_ value: NSInteger) -> Self {
        tag = value
        return self
    }
}


extension CALayer {
    public func cornerRadius(_ value: CGFloat) -> Self {
        cornerRadius = value
        return self
    }
    public func border(_ width: CGFloat, _ color: UIColor) -> Self {
        borderWidth = width
        borderColor = color.cgColor
        return self
    }
    
    
}
