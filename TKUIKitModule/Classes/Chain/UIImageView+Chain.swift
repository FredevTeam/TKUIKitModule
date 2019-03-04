
//
//  UIImageView+Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation


extension UIImageView {
    
    public func image(_ value: UIImage?) -> Self {
        image = value
        return self
    }
    public func animationImages(_ value: [UIImage]?) -> Self {
        animationImages = value
        return self
    }
    public func animationDuration(_ value: TimeInterval) -> Self {
        animationDuration = value
        return self
    }
    public func animationRepeatCount(_ value: Int) -> Self {
        animationRepeatCount = value
        return self
    }
    @available(iOS 3.0, *)
    public func highlightedImage(_ value: UIImage?) -> Self {
        highlightedImage = value
        return self
    }
    public func highlighted(_ value: Bool) -> Self {
        isHighlighted = value
        return self
    }
    @available(iOS 3.0, *)
    public func highlightedAnimationImages(_ value: [UIImage]?) -> Self {
        highlightedAnimationImages = value
        return self
    }
}
