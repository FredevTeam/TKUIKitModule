//
//  UIBezierPath+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/9.
//

import Foundation


// MARK: - UIBazierPath
extension TypeWrapperProtocol where WrappedType : UIBezierPath {
    
    /// 获取曲线上的点
    ///
    /// - Returns: 点数组
    @available(iOS 11, *)
    public func points() -> [CGPoint] {
        debugPrint("此方法未实现")
        return []
    }
    
    
    
}
