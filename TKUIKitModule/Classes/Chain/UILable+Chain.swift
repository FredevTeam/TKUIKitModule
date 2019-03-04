
//
//  UILable+Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation


extension UILabel {
    
    public func text(_ value: String?) -> Self {
        text = value
        return self
    }
    
    
    public func font(_ value: UIFont!) -> Self {
        font = value
        return self
    }
    
    
    public func textColor(_ value: UIColor!) -> Self {
        textColor = value
        return self
    }
    
    public func textAlignment(_ value: NSTextAlignment) -> Self {
        textAlignment = value
        return self
    }
    
    public func lineBreakMode(_ value: NSLineBreakMode) -> Self {
        lineBreakMode = value
        return self
    }
    
    public func attributedText(_ value: NSAttributedString?) -> Self {
        attributedText = value
        return self
    }


    public func numberOfLines(_ value: Int) -> Self {
        numberOfLines = value
        return self
    }
    
    public func adjustsFontSizeToFitWidth(_ value: Bool) -> Self {
        adjustsFontSizeToFitWidth = value
        return self
    }
}
