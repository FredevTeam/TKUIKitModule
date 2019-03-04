//
//  UITextView+Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation


extension UITextView {
    
    public func text(_ value: String!) -> Self {
        text = value
        return self
    }
    
    public func font(_ value: UIFont?) -> Self {
        font = value
        return self
    }
    
    public func textColor(_ value: UIColor?) -> Self {
        textColor = value
        return self
    }
    
    public func textAlignment(_ value: NSTextAlignment) -> Self {
        textAlignment = value
        return self
    }
    public func isEditable(_ value: Bool) -> Self {
        isEditable = value
        return self
    }
    
}
