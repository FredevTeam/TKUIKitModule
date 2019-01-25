//
//  UILabel+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/8.
//

import Foundation
extension TypeWrapperProtocol where WrappedType == UILabel {
    
    /// create label with font and title
    ///
    /// - Parameters:
    ///   - font: font
    ///   - text: text
    ///   - textAlignment: textAlignment
    /// - Returns: UILabel
    public static func create(with text: String?,font: UIFont, textAlignment:NSTextAlignment? = .left) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = font
        label.textAlignment = textAlignment ?? .left
        label.text = text
        label.sizeToFit()
        return label
    }
    
    
    /// create label with attribute string
    ///
    /// - Parameters:
    ///   - text: attribute text
    ///   - textAlignment: textAlignment
    /// - Returns: UILabel
    public static func create(with text: NSAttributedString?,textAlignment:NSTextAlignment? = .left) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = textAlignment ?? .left
        label.attributedText = text
        label.sizeToFit()
        return label
    }
}
