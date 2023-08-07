//
//  AutoLayout+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/11/11.
//

import Foundation
import UIKit
//#define RealValue(vaule) ((vaule)/375.0f * [UIScreen mainScreen].bounds.size.width) /** 适配屏幕因数**/
fileprivate let defaultScreenWidth:CGFloat = 375.0
fileprivate let screenWidth = UIScreen.main.bounds.size.width


/// MARK: - AutoLayout
/**
 - Note:
    此处采用的是默认计算方式：
    ```
        defaultScreenWidth:CGFloat = 375.0
        screenWidth = UIScreen.main.bounds.size.width

        计算比例
        ((vaule)/375.0f * [UIScreen mainScreen].bounds.size.width)
    ```


 */
extension Double {

    /// auto layout
    ///
    /// - Returns: auto size
    public func autoLayout() -> CGFloat {
         return ceil(CGFloat(self) * screenWidth / defaultScreenWidth)
    }
}

extension Int {

    /// auto Layout
    ///
    /// - Returns: auto size
    public func autoLayout() -> CGFloat {
        return ceil(CGFloat(self) * screenWidth / defaultScreenWidth)
    }
}

extension Float {
    /// auto Layout
    ///
    /// - Returns: auto size
    public func autoLayout() -> CGFloat {
        return ceil(CGFloat(self) * screenWidth / defaultScreenWidth)
    }
}

extension CGFloat {
    /// auto Layout
    ///
    /// - Returns: auto size
    public func autoLayout() -> CGFloat {
        return ceil(CGFloat(self) * screenWidth / defaultScreenWidth)
    }
}

extension NSNumber {
    /// auto Layout
    ///
    /// - Returns: auto size
    public func autoLayout() -> CGFloat {
        return ceil(CGFloat(truncating: self) * screenWidth / defaultScreenWidth)
    }
}




