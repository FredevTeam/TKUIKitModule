//
//  Chain.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/4.
//

import Foundation


public protocol ViewChain{
    
}

extension ViewChain where Self:UIView {
    @discardableResult
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

extension ViewChain where Self : Any {
    
    @discardableResult
    public func with(_ completion:(inout Self) -> Void) -> Self {
        var s = self
        completion(&s)
        return s
    }
    
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


