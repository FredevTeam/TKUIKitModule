//
//  UIScrollView+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/8.
//

import Foundation

extension TypeWrapperProtocol where WrappedType == UIScrollView {
    
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
