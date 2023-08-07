//
//  UILabel+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/8.
//

import Foundation
import UIKit
// MARK: - UILabel Create
extension TypeWrapperProtocol where WrappedType : UILabel {
    
    /// create label with font and title
    ///
    /// - Parameters:
    ///   - font: font
    ///   - text: text
    ///   - textAlignment: textAlignment
    /// - Returns: UILabel
    public static func create(with text: String?,font: UIFont, textAlignment:NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = font
        label.textAlignment = textAlignment
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
    public static func create(with text: NSAttributedString?,textAlignment:NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = textAlignment
        label.attributedText = text
        label.sizeToFit()
        return label
    }


}

// MARK: - UILabel Other 
extension TypeWrapperProtocol where WrappedType : UILabel {

    /// set lin specing(设置行间距)
    ///
    /// - Parameters:
    ///   - text: text
    ///   - line: line spec
    public func setText(text:String, specing line: Float) {
        if line < 0.01 {
            self.wrappedValue.text = text
            return
        }
        let paragraphStype = NSMutableParagraphStyle.init()
        paragraphStype.lineSpacing = CGFloat(line)
        paragraphStype.lineBreakMode = self.wrappedValue.lineBreakMode
        paragraphStype.alignment = self.wrappedValue.textAlignment
        self.wrappedValue.attributedText = NSAttributedString.init(string: text, attributes: [NSAttributedString.Key.paragraphStyle : paragraphStype])
    }
}
