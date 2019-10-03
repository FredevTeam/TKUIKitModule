//
//  UIScrollView+Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation


/// UIScrollView Chain
extension UIScrollView {

    /// contentSize
    ///
    /// - Parameter value: contentSize vlaue
    /// - Returns: Self
    public func contentSize(_ value: CGSize) -> Self {
        contentSize = value
        return self
    }
    /// bounces
    ///
    /// - Parameter value: bounces vlaue
    /// - Returns: Self
    public func bounces(_ value: Bool) -> Self {
        bounces = value
        return self
    }
    /// alwaysBounceVertical
    ///
    /// - Parameter value: alwaysBounceVertical vlaue
    /// - Returns: Self
    public func alwaysBounceVertical(_ value: Bool) -> Self {
        alwaysBounceVertical = value
        return self
    }
    /// alwaysBounceHorizontal
    ///
    /// - Parameter value: alwaysBounceHorizontal vlaue
    /// - Returns: Self
    public func alwaysBounceHorizontal(_ value: Bool) -> Self {
        alwaysBounceHorizontal = value
        return self
    }
    /// isPagingEnabled
    ///
    /// - Parameter value: isPagingEnabled vlaue
    /// - Returns: Self
    public func isPagingEnabled(_ value: Bool) -> Self {
        isPagingEnabled = value
        return self
    }
    /// isScrollEnabled
    ///
    /// - Parameter value: isScrollEnabled vlaue
    /// - Returns: Self
    public func isScrollEnabled(_ value: Bool) -> Self {
        isScrollEnabled = value
        return self
    }
    /// showsHorizontalScrollIndicator
    ///
    /// - Parameter value: showsHorizontalScrollIndicator vlaue
    /// - Returns: Self
    public func showsHorizontalScrollIndicator(_ value: Bool) -> Self {
        showsHorizontalScrollIndicator = value
        return self
    }
    /// showsVerticalScrollIndicator
    ///
    /// - Parameter value: showsVerticalScrollIndicator vlaue
    /// - Returns: Self
    public func showsVerticalScrollIndicator(_ value: Bool) -> Self {
        showsVerticalScrollIndicator = value
        return self
    }
}
