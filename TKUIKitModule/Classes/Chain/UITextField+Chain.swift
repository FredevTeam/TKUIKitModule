//
//  UITextField+Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation
import UIKit

///  UITextField Chain
extension UITextField {

    /// Text
    ///
    /// - Parameter value: text value
    /// - Returns: Self
    public func text(_ value: String?) -> Self {
        text = value
        return self
    }
    /// placeholder
    ///
    /// - Parameter value: placeholder value
    /// - Returns: Self
    public func placeholder(_ value: String?) -> Self {
        placeholder = value
        return self
    }
    /// font
    ///
    /// - Parameter value: font value
    /// - Returns: Self
    public func font(_ value: UIFont?) -> Self {
        font = value
        return self
    }
    /// textAlignment
    ///
    /// - Parameter value: textAlignment value
    /// - Returns: Self
    public func textAlignment(_ value: NSTextAlignment) -> Self {
        textAlignment = value
        return self
    }
    /// borderStyle
    ///
    /// - Parameter value: borderStyle value
    /// - Returns: Self
    public func borderStyle(_ value: UITextField.BorderStyle) -> Self {
        borderStyle = value
        return self
    }
    /// textColor
    ///
    /// - Parameter value: textColor value
    /// - Returns: Self
    public func textColor(_ value: UIColor?) -> Self {
        textColor = value
        return self
    }
    /// clearsOnBeginEditing
    ///
    /// - Parameter value: clearsOnBeginEditing value
    /// - Returns: Self
    public func clearsOnBeginEditing(_ value: Bool) -> Self {
        clearsOnBeginEditing = value
        return self
    }
    /// adjustsFontSizeToFitWidth
    ///
    /// - Parameter value: adjustsFontSizeToFitWidth value
    /// - Returns: Self
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
    /// allowsEditingTextAttributes
    ///
    /// - Parameter value: allowsEditingTextAttributes value
    /// - Returns: Self
    public func allowsEditingTextAttributes(_ value: Bool) -> Self {
        allowsEditingTextAttributes = value
        return self
    }
    /// background
    ///
    /// - Parameter value: background value
    /// - Returns: Self
    public func background(_ value: UIImage?) -> Self {
        background = value
        return self
    }
    /// attributedText
    ///
    /// - Parameter value: attributedText value
    /// - Returns: Self
    @available(iOS 6.0, *)
    public func attributedText(_ value: NSAttributedString) -> Self {
        attributedText = value
        return self
    }
    /// defaultTextAttributes
    ///
    /// - Parameter value: defaultTextAttributes value
    /// - Returns: Self
    @available(iOS 7.0, *)
    public func defaultTextAttributes(_ value: [NSAttributedString.Key : Any]) -> Self {
        self.defaultTextAttributes = value
        return self
    }
    /// attributedPlaceholder
    ///
    /// - Parameter value: attributedPlaceholder value
    /// - Returns: Self
    public func attributedPlaceholder(_ value: NSAttributedString?) -> Self {
        attributedPlaceholder = value
        return self
    }

}
