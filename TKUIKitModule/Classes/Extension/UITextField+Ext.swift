//
//  UITextField+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/8.
//

import Foundation

extension TypeWrapperProtocol where WrappedType == UITextField {
    
    /// create UITextField
    ///
    /// - Parameters:
    ///   - placeholder: placeholder
    ///   - delegate: delegate
    ///   - clearButtonMode: clearButtonMode
    ///   - isSecureTextEntry: isSecureTextEntry
    ///   - keyboardType: keyboardType
    ///   - borderStyle: borderStyle
    /// - Returns: UITextField
    public static func create(with placeholder: String?, delegate: UITextFieldDelegate?,clearButtonMode: UITextFieldViewMode? = .never,isSecureTextEntry: Bool? = false , keyboardType:UIKeyboardType? = .default, borderStyle: UITextBorderStyle? = .none) -> UITextField{
        let textField =  UITextField()
        textField.placeholder = placeholder
        textField.adjustsFontSizeToFitWidth = true
        textField.delegate = delegate
        textField.clearButtonMode = clearButtonMode ?? .never
        textField.isSecureTextEntry = isSecureTextEntry ?? false
        textField.keyboardType = keyboardType ?? .default
        textField.borderStyle = borderStyle ?? .none
        return textField
    }
    
}
