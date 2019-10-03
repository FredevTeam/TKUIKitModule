
//
//  UIImageView+Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation

///  UIImageView Chain
extension UIImageView {
    
    /// image
    ///
    /// - Parameter value: image value
    /// - Returns: Self
    public func image(_ value: UIImage?) -> Self {
        image = value
        return self
    }
    /// animationImages
    ///
    /// - Parameter value: animationImages value
    /// - Returns: Self
    public func animationImages(_ value: [UIImage]?) -> Self {
        animationImages = value
        return self
    }
    /// animationDuration
    ///
    /// - Parameter value: animationDuration value
    /// - Returns: Self
    public func animationDuration(_ value: TimeInterval) -> Self {
        animationDuration = value
        return self
    }
    /// animationRepeatCount
    ///
    /// - Parameter value: animationRepeatCount value
    /// - Returns: Self
    public func animationRepeatCount(_ value: Int) -> Self {
        animationRepeatCount = value
        return self
    }
    /// highlightedImage
    ///
    /// - Parameter value: highlightedImage value
    /// - Returns: Self
    @available(iOS 3.0, *)
    public func highlightedImage(_ value: UIImage?) -> Self {
        highlightedImage = value
        return self
    }
    /// highlighted
    ///
    /// - Parameter value: highlighted value
    /// - Returns: Self
    public func highlighted(_ value: Bool) -> Self {
        isHighlighted = value
        return self
    }
    /// highlightedAnimationImages
    ///
    /// - Parameter value: highlightedAnimationImages value
    /// - Returns: Self
    @available(iOS 3.0, *)
    public func highlightedAnimationImages(_ value: [UIImage]?) -> Self {
        highlightedAnimationImages = value
        return self
    }
}
