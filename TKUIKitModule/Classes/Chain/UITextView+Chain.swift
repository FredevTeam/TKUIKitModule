//
//  UITextView+Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation
import UIKit

/// UITextView Chain
extension UITextView {
    
    /// Text
    ///
    /// - Parameter value: text value
    /// - Returns: Self
    public func text(_ value: String!) -> Self {
        text = value
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
    /// textColor
    ///
    /// - Parameter value: textColor value
    /// - Returns: Self
    public func textColor(_ value: UIColor?) -> Self {
        textColor = value
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
    /// isEditable
    ///
    /// - Parameter value: isEditable value
    /// - Returns: Self
    public func isEditable(_ value: Bool) -> Self {
        isEditable = value
        return self
    }
    
}
