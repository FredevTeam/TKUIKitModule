//
//  UITextField+Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation

extension UITextField {
    public func text(_ value: String?) -> Self {
        text = value
        return self
    }
    public func placeholder(_ value: String?) -> Self {
        placeholder = value
        return self
    }
    
    public func font(_ value: UIFont?) -> Self {
        font = value
        return self
    }
    public func textAlignment(_ value: NSTextAlignment) -> Self {
        textAlignment = value
        return self
    }
    public func borderStyle(_ value: UITextField.BorderStyle) -> Self {
        borderStyle = value
        return self
    }
    public func textColor(_ value: UIColor?) -> Self {
        textColor = value
        return self
    }
    public func clearsOnBeginEditing(_ value: Bool) -> Self {
        clearsOnBeginEditing = value
        return self
    }
    public func adjustsFontSizeToFitWidth(_ value: Bool) -> Self {
        adjustsFontSizeToFitWidth = value
        return self
    }
    public func clearButtonMode(_ value: UITextField.ViewMode) -> Self {
        clearButtonMode = value
        return self
    }
    public func leftViewMode(_ value: UITextField.ViewMode) -> Self {
        leftViewMode = value
        return self
    }
    public func rightViewMode(_ value: UITextField.ViewMode) -> Self {
        rightViewMode = value
        return self
    }
    public func allowsEditingTextAttributes(_ value: Bool) -> Self {
        allowsEditingTextAttributes = value
        return self
    }
    public func background(_ value: UIImage?) -> Self {
        background = value
        return self
    }
    
    @available(iOS 6.0, *)
    public func attributedText(_ value: NSAttributedString) -> Self {
        attributedText = value
        return self
    }
    
    @available(iOS 7.0, *)
    public func defaultTextAttributes(_ value: [NSAttributedString.Key : Any]) -> Self {
        self.defaultTextAttributes = value
        return self
    }
    public func attributedPlaceholder(_ value: NSAttributedString?) -> Self {
        attributedPlaceholder = value
        return self
    }

}
