//
//  UIScreen+Ext.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/4/5.
//

import Foundation


extension TypeWrapperProtocol where WrappedType == UIScreen {

    
    /// orientation 方向
    ///
    /// - Returns: 方向
    public func orientation() -> UIInterfaceOrientation {
        let point = self.wrappedValue.coordinateSpace.convert(CGPoint.zero, to: self.wrappedValue.fixedCoordinateSpace)
        if point.x == 0 && point.y == 0 {
            return .portrait
        } else if (point.x != 0 && point.y != 0) {
            return .portraitUpsideDown
        } else if (point.x == 0 && point.y != 0) {
            return .landscapeLeft
        } else if (point.x != 0 && point.y == 0) {
            return .landscapeRight
        } else {
            return .unknown
        }
    }

}
