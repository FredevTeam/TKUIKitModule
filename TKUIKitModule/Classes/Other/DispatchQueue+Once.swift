//
//  DispatchQueue+Once.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/10/4.
//

import UIKit

extension DispatchQueue {

    private static var _onceTracker = [String]()
    class func once(_ token: String = UUID.init().uuidString, block:()->Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }

        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
    }
}

extension UIView {
    /// 方法交换
    ///
    /// - Parameters:
    ///   - forClass: 目标类
    ///   - originalSelector: 原方法
    ///   - swizzledSelector: 目标方法
    static func swizzling(_ forClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
        let originalMethod = class_getInstanceMethod(forClass, originalSelector)
        let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)

        guard (originalMethod != nil && swizzledMethod != nil) else {
            return
        }
        if class_addMethod(forClass, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!)) {
            class_replaceMethod(forClass, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
    }


}
