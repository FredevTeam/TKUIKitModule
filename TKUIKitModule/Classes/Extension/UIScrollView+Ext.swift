//
//  UIScrollView+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/8.
//

import Foundation

// MARK: - UIScroll View Create
extension TypeWrapperProtocol where WrappedType : UIScrollView {
    
    /// crate scrollView
    ///
    /// - Parameter delegate: delegate
    /// - Returns: UIScrollView
    public static func create(with delegate:UIScrollViewDelegate?) -> UIScrollView{
        let scrollView =  UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.alwaysBounceVertical = false
        scrollView.bounces = false
        scrollView.delegate = delegate
        return scrollView
    }

}


// MARK: - UIScrollView Scroll 
extension TypeWrapperProtocol where WrappedType : UIScrollView {


    /// scroll to top
    ///
    /// - Parameter animation: is animation
    public func scrollToTop(animated: Bool = false ) {
        self.wrappedValue.setContentOffset(CGPoint.init(x: 0, y: 0), animated: animated)
    }


    /// scroll to buttom
    ///
    /// - Parameter animated: animated
    public func scrollToButtom(animated: Bool = false) {
        let offset = self.wrappedValue.contentSize.height - self.wrappedValue.bounds.height
        if offset > 0 {
            self.wrappedValue.setContentOffset(CGPoint.init(x: 0, y: offset), animated: animated)
        }
    }
}
