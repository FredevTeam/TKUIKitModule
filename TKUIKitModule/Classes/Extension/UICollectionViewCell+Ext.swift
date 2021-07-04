//
//  UICollectionViewCell+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/9.
//

import Foundation

// MARK: - UICollectionViewCell 
extension TypeWrapperProtocol where WrappedType : UICollectionViewCell {
    
    /// 获取一个 identifier 根据当前类名
    ///
    /// - Returns: identifier
    static func identifier()  -> String {
        return String(describing: self.WrappedType.classForCoder)
    }
}
