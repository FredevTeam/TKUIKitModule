//
//  UIView+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/11/9.
//

import Foundation

extension UIView: NamespaceWrappable{}
extension TypeWrapperProtocol where WrappedType == UIView {
    /// 删除所有子view
    public func removeAllSubview(){
        for view  in self.wrappedValue.subviews {
            view.removeFromSuperview()
        }
    }
    
    /// 删除所有的 gesture 
    public func removeAllGesture() {
        for gestrue in self.wrappedValue.gestureRecognizers ?? [] {
            self.wrappedValue.removeGestureRecognizer(gestrue)
        }
    }
    
    
    /// 顶部 view
    ///
    /// - Returns: top view
    public func topView() -> UIView {
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindowLevelNormal {
            let windowArray = UIApplication.shared.windows
            for tempWin in windowArray {
                window = tempWin
                break
            }
        }
        return window!
    }
    
    /// 两点之间距离
    ///
    /// - Parameters:
    ///   - point1: 点1
    ///   - point2: 点2
    /// - Returns: 距离结果
    public static func distance(point1: CGPoint , point2:CGPoint) -> CGFloat {
        return sqrt(pow(point1.x - point2.x, 2) + pow(point1.y - point2.y, 2))
    }
    
    /// 添加圆角效果
    ///
    /// - Parameters:
    ///   - corners: 样式，几个脚添加
    ///   - cornerRadii: 圆角大小
    public func round(by corners: UIRectCorner = UIRectCorner.allCorners, cornerRadii: CGFloat) {
        self.round(by: corners, cornerRadii: CGSize(width: cornerRadii, height: cornerRadii))
    }
    /// 添加圆角
    ///
    /// - Parameters:
    ///   - corners: 样式，几个脚添加
    ///   - cornerRadii: 圆角大小
    public func round(by corners: UIRectCorner = UIRectCorner.allCorners, cornerRadii: CGSize) {
        let bezierPath = UIBezierPath(roundedRect: self.wrappedValue.bounds,
                                      byRoundingCorners: corners,
                                      cornerRadii: cornerRadii)
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        self.wrappedValue.layer.mask = shapeLayer
        self.wrappedValue.layer.masksToBounds = true
        
    }
    
    /// 判断当前 与 view 是否相交
    ///
    /// - Parameter view: target view
    /// - Returns: true/ false
    public func intersect(with view: UIView) -> Bool {
        let window = UIApplication.shared.keyWindow
        let selfRect = self.wrappedValue.convert(self.wrappedValue.bounds, to: window)
        let viewRect = view.convert(view.bounds, to: window)
        return selfRect.intersects(viewRect)
    }
    
    /// 绘制虚线
    ///
    /// - Parameters:
    ///   - path: bezierPath
    ///   - pattern: @[@6,@10]
    ///   - strokeColor: color
    ///   - linWith: lineWith
    public func dottedLine(path: UIBezierPath, pattern:[NSNumber], strokeColor: UIColor,lineWith: CGFloat) {
        let layer = CAShapeLayer()
        layer.strokeColor = strokeColor.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = lineWith
        layer.lineJoin = kCALineJoinRound
        layer.lineCap = kCALineCapRound
        layer.lineDashPattern = pattern
        layer.path = path.cgPath
        self.wrappedValue.layer.addSublayer(layer)
    }
    
    
    /// 动画执行
    ///
    /// - Parameters:
    ///   - duration: 动画时间
    ///   - timingFuncion: timingFuncion 时间线
    ///   - animations: 动画回调
    public func transactionAnimation(with duration: CFTimeInterval, timingFuncion: CAMediaTimingFunction, animations: () -> Void) {
        CATransaction.begin()
        CATransaction.disableActions()
        CATransaction.setAnimationDuration(duration)
        CATransaction.setAnimationTimingFunction(timingFuncion)
        animations()
        CATransaction.commit()
    }
    
    
    /// 动画更新约束  需要将约束写在 updateConstraints 方法中
    ///
    /// - Parameter duration: 动画执行时间
    public func animationUpdate(duration: TimeInterval? = 0.3) {
        self.wrappedValue.setNeedsUpdateConstraints()
        self.wrappedValue.updateConstraintsIfNeeded()
        UIView.animate(withDuration: duration ?? 0.3) {
            self.wrappedValue.layoutIfNeeded()
        }
    }
    
    
    /// 动画更新约束
    /// 需要将约束写在 updateConstraints 方法中
    /// - Parameters:
    ///   - duration: 动画执行时间
    ///   - block: 执行结束回调block
    public func animationUpdate(duration: TimeInterval? = 0.3,block:(() -> Void)?) {
        self.wrappedValue.setNeedsUpdateConstraints()
        self.wrappedValue.updateConstraintsIfNeeded()
        UIView.animate(withDuration: duration ?? 0.3, animations: {
            self.wrappedValue.layoutIfNeeded()
        }) { (result ) in
            block?()
        }
    }
}
extension UIView {
    

    // x
    var x : CGFloat {
        
        get {
            
            return frame.origin.x
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.origin.x     = newVal
            frame                 = tmpFrame
        }
    }
    
    // y
    var y : CGFloat {
        
        get {
            
            return frame.origin.y
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.origin.y     = newVal
            frame                 = tmpFrame
        }
    }
    
    // height
    var height : CGFloat {
        
        get {
            
            return frame.size.height
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.size.height  = newVal
            frame                 = tmpFrame
        }
    }
    
    // width
    var width : CGFloat {
        
        get {
            
            return frame.size.width
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.size.width   = newVal
            frame                 = tmpFrame
        }
    }
    
    // left
    var left : CGFloat {
        
        get {
            
            return x
        }
        
        set(newVal) {
            
            x = newVal
        }
    }
    
    // right
    var right : CGFloat {
        
        get {
            
            return x + width
        }
        
        set(newVal) {
            
            x = newVal - width
        }
    }
    
    // top
    var top : CGFloat {
        
        get {
            
            return y
        }
        
        set(newVal) {
            
            y = newVal
        }
    }
    
    // bottom
    var bottom : CGFloat {
        
        get {
            
            return y + height
        }
        
        set(newVal) {
            
            y = newVal - height
        }
    }
    
    var centerX : CGFloat {
        
        get {
            
            return center.x
        }
        
        set(newVal) {
            
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    
    var centerY : CGFloat {
        
        get {
            
            return center.y
        }
        
        set(newVal) {
            
            center = CGPoint(x: center.x, y: newVal)
        }
    }
    
    var middleX : CGFloat {
        
        get {
            
            return width / 2
        }
    }
    
    var middleY : CGFloat {
        
        get {
            
            return height / 2
        }
    }
    
    var middlePoint : CGPoint {
        
        get {
            
            return CGPoint(x: middleX, y: middleY)
        }
    }
    
    var maxX: CGFloat {
        get {
            return frame.maxX
        }
    }
    
    var maxY: CGFloat {
        get {
            return frame.maxY
        }
    }
}



