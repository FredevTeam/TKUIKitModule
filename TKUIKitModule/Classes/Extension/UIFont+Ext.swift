//
//  UIFont+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/30.
//

import Foundation
import UIKit
extension UIFont : NamespaceWrappable{}

// MARK: - UIFont 
extension TypeWrapperProtocol where WrappedType : UIFont {
    
    
    /// 获取系统中所有的字体名称， debug 模式会打印出所有的字体名称
    ///
    /// - Parameter debug: true 打印  false 不打印
    /// - Returns: 字体名称数组
    static func names(debug: Bool) -> [String]  {
       var names = [String]()
        let familyNames = UIFont.familyNames
        for name in familyNames {
            let fontNames = UIFont.fontNames(forFamilyName: name)
            for name in fontNames {
                if debug {
                    debugPrint("font name:\(name)")
                }
                names.append(name)
            }
        }
        return names
    }
    
}
