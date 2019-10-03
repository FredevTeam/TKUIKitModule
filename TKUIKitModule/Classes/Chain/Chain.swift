//
//  Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation



/// 链式 协议
public protocol ViewChain{
    
}

/// ViewChain UIView
extension ViewChain where Self:UIView {

    @discardableResult

    /// then 连接
    ///
    /// - Parameter completion: 回调 block
    /// - Returns: Self
    public func then(_ completion:(Self) -> Void) -> Self {
        completion(self)
        return self
    }
    /// 最终的
    ///
    /// - Parameter complany: 回调
    public func finally(_ completion:(Self) -> Void) {
        completion(self)
    }
}


/// View Chain Where Any
extension ViewChain where Self : Any {
    
    @discardableResult

    /// whth
    ///
    /// - Parameter completion: complation
    /// - Returns: Self
    public func with(_ completion:(inout Self) -> Void) -> Self {
        var s = self
        completion(&s)
        return s
    }
    
    /// do
    ///
    /// - Parameter block: complation block
    public func `do`(_ block:(Self) -> Void) {
        block(self)
    }
}

extension UIView : ViewChain {}
extension CGPoint: ViewChain {}
extension CGRect: ViewChain {}
extension CGSize: ViewChain {}
extension CGVector : ViewChain {}
extension CALayer : ViewChain {}


