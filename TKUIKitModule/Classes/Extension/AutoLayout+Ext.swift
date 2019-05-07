//
//  AutoLayout+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/11/11.
//

import Foundation
//#define RealValue(vaule) ((vaule)/375.0f * [UIScreen mainScreen].bounds.size.width) /** 适配屏幕因数**/
fileprivate let defaultScreenWidth:CGFloat = 375.0
fileprivate let screenWidth = UIScreen.main.bounds.size.width
extension Double {

    /// auto layout
    ///
    /// - Returns: 
    public func autoLayout() -> CGFloat {
         return ceil(CGFloat(self) * screenWidth / defaultScreenWidth)
    }
}

extension Int {
    public func autoLayout() -> CGFloat {
        return ceil(CGFloat(self) * screenWidth / defaultScreenWidth)
    }
}

extension Float {
    public func autoLayout() -> CGFloat {
        return ceil(CGFloat(self) * screenWidth / defaultScreenWidth)
    }
}

extension CGFloat {
    public func autoLayout() -> CGFloat {
        return ceil(CGFloat(self) * screenWidth / defaultScreenWidth)
    }
}

extension NSNumber {
    public func autoLayout() -> CGFloat {
        return ceil(CGFloat(truncating: self) * screenWidth / defaultScreenWidth)
    }
}




