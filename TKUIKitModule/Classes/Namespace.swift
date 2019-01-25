//
//  Namespace.swift
//  Pods-TKUIKitModule_Example
//
//  Created by zhuamaodeyu on 2018/11/12.
//

import Foundation
///////////////////////////协议命名空间///////////////////////////////////
/// 命名空间协议  此处的tk 是类协议的
public protocol NamespaceWrappable {
    associatedtype WrapperType
    var ui: WrapperType { get }
    static var ui: WrapperType.Type { get }
}
public extension NamespaceWrappable {
    var ui: NamespaceWrapper<Self> {
        return NamespaceWrapper(value: self)
    }
    static var ui: NamespaceWrapper<Self>.Type {
        return NamespaceWrapper.self
    }
}

/// 此处的是object 对象的 
public protocol TypeWrapperProtocol {
    associatedtype WrappedType
    var wrappedValue: WrappedType { get }
    init(value: WrappedType)
}

public struct NamespaceWrapper<T>: TypeWrapperProtocol {
    public let wrappedValue: T
    public init(value: T) {
        self.wrappedValue = value
    }
}


///////////////////////////基础类命名空间///////////////////////////
/////定义泛型类
///// 优点: 解决了 内部self 调用的问题
//public final class Namespace<Base> {
//    public let base : Base
//    public init (_ base: Base) {
//        self.base = base
//    }
//}
//
//public protocol NamespaceCompatible {
//    associatedtype CompatibleType
//    var tk: CompatibleType { get }
//    static var tk : CompatibleType.Type { get }
//}
//
//public extension NamespaceCompatible {
//    public var tk : Namespace<Self> {
//        get {return Namespace(self)}
//    }
//    public static var tk: Namespace<Self>.Type {
//        return Namespace.self
//    }
//}

