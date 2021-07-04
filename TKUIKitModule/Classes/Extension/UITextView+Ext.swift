//
//  UITextView+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/8.
//

import Foundation

// MARK: - UITextView
extension TypeWrapperProtocol where WrappedType : UITextView {
    
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

    
    /// 插入内容，带有block 回调
    ///
    /// - Parameters:
    ///   - text: 内容
    ///   - block: block 回调
    public func insert(attributed text : NSAttributedString, block:((_ string:NSAttributedString)-> Void)? = nil) {
        let attributeText =  NSMutableAttributedString()
        attributeText.append(self.wrappedValue.attributedText)
        let loc  = self.wrappedValue.selectedRange.location
        
        attributeText.replaceCharacters(in: self.wrappedValue.selectedRange, with: text)
        block?(attributeText)
        self.wrappedValue.attributedText = attributeText
        self.wrappedValue.selectedRange = NSMakeRange(loc + 1, 0)
    }
    
}


// MARK: - UITextView done bar 
extension TypeWrapperProtocol where WrappedType : UITextView {
    
    /// 添加 done bar
    ///
    /// - Parameters:
    ///   - title: name
    ///   - style: style 
    public func done(title: String?, style: UIBarStyle = .default) {
        let bar = UIToolbar.init()
        bar.items = [
            UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil),
            UIBarButtonItem.init(title: title ?? "Done", style: .done, target: self, action: #selector(wrappedValue.resignFirstResponder))
        ]
        bar.barStyle = style
        bar.sizeToFit()
        wrappedValue.inputAccessoryView = bar
    }
}
