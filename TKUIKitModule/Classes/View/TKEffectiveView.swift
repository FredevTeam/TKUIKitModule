//
//  TKEffectiveView.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/10/5.
//

import UIKit


/// TKEffectiveView 有效区域
public class TKEffectiveView: UIView {


    /// 有效区域View
    public weak var maxEffectiveView: UIView?

    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if let _ = view, let maxView = maxEffectiveView {
            let temPoint = maxView.convert(point , from: self)
            if maxView.bounds.contains(temPoint) {
                return maxView
            }
        }
        return view
    }
}
