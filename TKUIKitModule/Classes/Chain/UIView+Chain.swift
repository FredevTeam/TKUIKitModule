//
//  UIView+Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation


///  UIView Chain
extension UIView {

    /// frame
    ///
    /// - Parameter value: frame value
    /// - Returns: Self
    public func frame(_ value: CGRect) -> Self {
        frame = value
        return self
    }
    /// userInteraction
    ///
    /// - Parameter value: userInteraction value
    /// - Returns: Self
    public func userInteractionEnabled(_ value: Bool) -> Self {
        isUserInteractionEnabled = value
        return self
    }
    /// bounds
    ///
    /// - Parameter value: bounds value
    /// - Returns: Self
    public func bounds(_ value: CGRect) -> Self {
        bounds = value
        return self
    }
    /// backgroundColor
    ///
    /// - Parameter value: backgroundColor value
    /// - Returns: Self
    public func backgroundColor(_ value: UIColor) -> Self {
        backgroundColor = value
        return self
    }
    /// hidden
    ///
    /// - Parameter value: hidden value
    /// - Returns: Self
    public func hidden(_ value: Bool) -> Self {
        isHidden = value
        return self
    }
    /// tag
    ///
    /// - Parameter value: tag value
    /// - Returns: Self
    public func tag(_ value: NSInteger) -> Self {
        tag = value
        return self
    }
}


/// CALayer 
extension CALayer {

    /// corner Radius
    ///
    /// - Parameter value: corner Radius Value
    /// - Returns: Self
    public func cornerRadius(_ value: CGFloat) -> Self {
        cornerRadius = value
        return self
    }
    
    /// border
    ///
    /// - Parameters:
    ///   - width: border width
    ///   - color: border color
    /// - Returns: Self
    public func border(_ width: CGFloat, _ color: UIColor) -> Self {
        borderWidth = width
        borderColor = color.cgColor
        return self
    }
    
    
}
