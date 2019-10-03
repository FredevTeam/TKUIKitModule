
//
//  UILable+Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation


/// UILabel Chain
extension UILabel {

    /// text
    ///
    /// - Parameter value: text value
    /// - Returns: Self
    public func text(_ value: String?) -> Self {
        text = value
        return self
    }
    
    /// font
    ///
    /// - Parameter value: font value
    /// - Returns: Self
    public func font(_ value: UIFont!) -> Self {
        font = value
        return self
    }
    
    /// textColor
    ///
    /// - Parameter value: textColor value
    /// - Returns: Self
    public func textColor(_ value: UIColor!) -> Self {
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
    /// lineBreakMode
    ///
    /// - Parameter value: lineBreakMode value
    /// - Returns: Self
    public func lineBreakMode(_ value: NSLineBreakMode) -> Self {
        lineBreakMode = value
        return self
    }
    /// attributedText
    ///
    /// - Parameter value: attributedText value
    /// - Returns: Self
    public func attributedText(_ value: NSAttributedString?) -> Self {
        attributedText = value
        return self
    }

    /// numberOfLines
    ///
    /// - Parameter value: numberOfLines value
    /// - Returns: Self
    public func numberOfLines(_ value: Int) -> Self {
        numberOfLines = value
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
}
