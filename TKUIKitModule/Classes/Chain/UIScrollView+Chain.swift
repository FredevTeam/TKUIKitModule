//
//  UIScrollView+Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation


extension UIScrollView {
    public func contentSize(_ value: CGSize) -> Self {
        contentSize = value
        return self
    }
    public func bounces(_ value: Bool) -> Self {
        bounces = value
        return self
    }
    public func alwaysBounceVertical(_ value: Bool) -> Self {
        alwaysBounceVertical = value
        return self
    }
    public func alwaysBounceHorizontal(_ value: Bool) -> Self {
        alwaysBounceHorizontal = value
        return self
    }
    public func isPagingEnabled(_ value: Bool) -> Self {
        isPagingEnabled = value
        return self
    }
    public func isScrollEnabled(_ value: Bool) -> Self {
        isScrollEnabled = value
        return self
    }
    public func showsHorizontalScrollIndicator(_ value: Bool) -> Self {
        showsHorizontalScrollIndicator = value
        return self
    }
    public func showsVerticalScrollIndicator(_ value: Bool) -> Self {
        showsVerticalScrollIndicator = value
        return self
    }
}
