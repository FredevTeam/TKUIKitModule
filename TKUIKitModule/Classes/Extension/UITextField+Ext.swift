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
    public static func create(with placeholder: String?, delegate: UITextFieldDelegate?,clearButtonMode: UITextFieldViewMode = .never,isSecureTextEntry: Bool = false , keyboardType:UIKeyboardType = .default, borderStyle: UITextBorderStyle = .none) -> UITextField{
        let textField =  UITextField()
        textField.placeholder = placeholder
        textField.adjustsFontSizeToFitWidth = true
        textField.delegate = delegate
        textField.clearButtonMode = clearButtonMode
        textField.isSecureTextEntry = isSecureTextEntry
        textField.keyboardType = keyboardType
        textField.borderStyle = borderStyle
        return textField
    }
    
    
    /// 设置左边的间距
    ///
    /// - Parameter width: 宽度
    public func leftPadding(width: CGFloat) {
        let leftView = UIView()
        leftView.frame = CGRect.init(x: 0, y: 0, width: width, height: wrappedValue.frame.height)
        wrappedValue.leftView = leftView
        wrappedValue.leftViewMode = .always
    }
    
    
    /// 设置左侧的icon
    ///
    /// - Parameters:
    ///   - image: image
    ///   - leftViewFrame: left view frame
    ///   - iconSize: icon size
    public func leftIcon(image: UIImage, leftViewFrame: CGRect? ,iconSize: CGSize = CGSize.zero) {
        let leftView = UIView()
        let imageView = UIImageView()
        imageView.image = image
        if iconSize == CGSize.zero {
            imageView.sizeToFit()
        }else {
            imageView.frame.size = iconSize
        }
        imageView.frame = CGRect.init(x: 0, y: (wrappedValue.frame.height - imageView.frame.height ) / 2, width: imageView.frame.width, height: imageView.frame.height)
        if leftViewFrame?.isEmpty ?? false  {
            leftView.frame = CGRect.init(x: 0, y: 0, width: imageView.width, height: wrappedValue.height)
        }else {
            leftView.frame = leftViewFrame ?? CGRect.zero
        }
        leftView.addSubview(imageView)
        
        wrappedValue.leftView = leftView
        wrappedValue.leftViewMode = .always
        
    }
}

extension TypeWrapperProtocol where WrappedType == UITextField {
    
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

