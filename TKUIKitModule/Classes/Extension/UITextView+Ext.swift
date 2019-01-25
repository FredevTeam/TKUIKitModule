//
//  UITextView+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/8.
//

import Foundation
extension TypeWrapperProtocol where WrappedType == UITextView {
    
    /// create textView
    ///
    /// - Parameters:
    ///   - text: text
    ///   - delegate: delegate
    ///   - isEdit: isEdit
    ///   - isScrollEnable: isScrollEnable
    ///   - scrollToTop: scrollToTop
    /// - Returns: UITextView
    public static func create(with text: String?, delegate: UITextViewDelegate? , isEdit: Bool? = true, isScrollEnable: Bool? = true, scrollToTop: Bool? = true ) -> UITextView{
        let textView = UITextView()
        textView.scrollsToTop = scrollToTop ?? true
        textView.isScrollEnabled = isScrollEnable ?? true
        textView.isEditable = isEdit ?? true
        textView.delegate = delegate
        textView.text = text
        return textView
    }
}
