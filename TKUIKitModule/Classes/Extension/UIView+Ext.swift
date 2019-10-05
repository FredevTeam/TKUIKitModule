//
//  UIView+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/11/9.
//

import Foundation

extension UIView: NamespaceWrappable{}

/// MARK: - UIView
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


    /// 绘制虚线
    ///
    /// - Parameters:
    ///   - lineLength: 宽度
    ///   - lineSpacing: 间距
    ///   - strokeColor: color
    public func dottedLine(lineLength:Float,lineSpacing: Float,strokeColor: UIColor) {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = self.wrappedValue.width
        layer.lineJoin = kCALineCapRound
        layer.lineDashPattern = [lineLength, lineSpacing] as [NSNumber]
        layer.lineDashPhase = 0
        let path:CGMutablePath = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: self.wrappedValue.width, y: 0))
        layer.path = path
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
    public func animationUpdate(duration: TimeInterval = 0.3) {
        self.wrappedValue.setNeedsUpdateConstraints()
        self.wrappedValue.updateConstraintsIfNeeded()
        UIView.animate(withDuration: duration) {
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
    
    
    /// 获取当前view 所在的控制器
    ///
    /// - Parameter clazz: 控制器类型 判断是否想要的
    /// - Returns: viewController
    public func viewController(clazz: AnyClass) -> UIViewController? {
        var next = self.wrappedValue.superview
        while next != nil {
            let nextResponder = next?.next
            if nextResponder?.isKind(of: clazz) != nil {
                return nextResponder as? UIViewController
            }
            next = nextResponder?.next as? UIView
        }
        return nil
    }
    
    
    
    /// 获取view 所在的控制器
    ///
    /// - Parameter view: view
    /// - Returns: viewController
    public func viewController(view: UIView?) -> UIViewController? {
        var next: UIResponder? = view?.next
        repeat {
            if (next as? UIViewController) != nil  {
                return next as? UIViewController
            }else {
                next = next?.next
            }
        }while next != nil
        return nil
    }
    
    /// 获取栈结构
    ///
    /// - Parameter vc: vc
    /// - Returns: viewControllers
    public func stackViewControllers(vc: UIViewController) -> [UIViewController] {
        var stack:[UIViewController] = []
        stack.append(vc)
        var next: UIResponder? = vc.next
        repeat {
            if (next as? UIViewController) != nil  {
                stack.insert(next as! UIViewController, at: 0)
            }else {
                next = next?.next
            }
        }while next != nil
        return stack
    }
    
    
    /// 异步处理数据刷新UI
    ///
    /// - Parameters:
    ///   - procedure: 处理数据block
    ///   - qos: DispatchQoS.QoSClass
    ///   - completion: 刷新UI block
    public func async<T>(_ procedure: @autoclosure @escaping () -> T,
                         qos: DispatchQoS.QoSClass = .userInitiated,
                         _ completion: @escaping (T)-> Void) {
        
        DispatchQueue.global(qos: qos).async {
            let value = procedure()
            DispatchQueue.main.async {
                completion(value)
            }
        }
    }
    
    
    /// 获取当前view 截图
    ///
    /// - Returns: 截图 image
    public func snapshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.wrappedValue.bounds.size, false, UIScreen.main.scale)
        self.wrappedValue.drawHierarchy(in: self.wrappedValue.frame, afterScreenUpdates: true)
        defer {
            UIGraphicsEndImageContext()
        }
         return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
    /// aniamte update constraints
    ///
    /// - Parameter duration: duration
    public func animateUpdateConstraint(duration: TimeInterval) {
        self.wrappedValue.needsUpdateConstraints()
        self.wrappedValue.updateConstraintsIfNeeded()
        self.wrappedValue.updateConstraints()
        UIView.animate(withDuration: duration) {
            self.wrappedValue.setNeedsDisplay()
            self.wrappedValue.layoutIfNeeded()
        }
    }
    
    
    /// animate before and finish
    ///
    /// - Parameters:
    ///   - duration: duration
    ///   - before: before block
    ///   - completion: completion block
    ///   - finally: finally block
    public static func animate(with duration:TimeInterval, before:(() -> Void)?, completion:@escaping (()-> Void), finally:((_ result:Bool)-> Void)?) {
        before?()
        UIView.animate(withDuration: duration, animations: completion) { (result) in
            finally?(result)
        }
    }

    
    
    /// 是否显示在view 上
    ///
    /// - Parameter view: 载体view
    /// - Returns: 结果
//    public func showing(to view: UIView) -> Bool {
//        
//        
//        print("please set view")
//        return  !self.wrappedValue.isHidden && self.wrappedValue.alpha > 0.01
//    }
}



///  UIView Frame Extension
extension UIView {

    /// x
    public var x : CGFloat {
        
        get {
            
            return frame.origin.x
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.origin.x     = newVal
            frame                 = tmpFrame
        }
    }
    
    /// y
    public var y : CGFloat {
        
        get {
            
            return frame.origin.y
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.origin.y     = newVal
            frame                 = tmpFrame
        }
    }
    
    /// height
    public var height : CGFloat {
        
        get {
            
            return frame.size.height
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.size.height  = newVal
            frame                 = tmpFrame
        }
    }
    
    /// width
    public var width : CGFloat {
        
        get {
            
            return frame.size.width
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.size.width   = newVal
            frame                 = tmpFrame
        }
    }
    
    /// left
    public var left : CGFloat {
        
        get {
            
            return x
        }
        
        set(newVal) {
            
            x = newVal
        }
    }
    
    /// right
    public var right : CGFloat {
        
        get {
            
            return x + width
        }
        
        set(newVal) {
            
            x = newVal - width
        }
    }
    
    /// top
    public var top : CGFloat {
        
        get {
            
            return y
        }
        
        set(newVal) {
            
            y = newVal
        }
    }
    
    /// bottom
    public var bottom : CGFloat {
        
        get {
            
            return y + height
        }
        
        set(newVal) {
            
            y = newVal - height
        }
    }
    
    /// centerX
    public var centerX : CGFloat {
        
        get {
            
            return center.x
        }
        
        set(newVal) {
            
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    
    /// centerY
    public var centerY : CGFloat {
        
        get {
            
            return center.y
        }
        
        set(newVal) {
            
            center = CGPoint(x: center.x, y: newVal)
        }
    }
    
    /// middleX
    public var middleX : CGFloat {
        
        get {
            
            return width / 2
        }
    }
    
    /// middleY
    public var middleY : CGFloat {
        
        get {
            
            return height / 2
        }
    }
    
    /// middlePoint
    public var middlePoint : CGPoint {
        
        get {
            
            return CGPoint(x: middleX, y: middleY)
        }
    }
    
    /// maxX
    public var maxX: CGFloat {
        get {
            return frame.maxX
        }
    }
    
    /// maxY
    public var maxY: CGFloat {
        get {
            return frame.maxY
        }
    }
}


// MARK: -  Max effective Frame
//extension UIView {
//    private struct AssociatedEffectiveKey {
//        static var max = "Effective_Max"
//    }
//
//    /// max Effective sub View
//    /// - Note:
//    ///     default self bounds
//    public var maxEffectiveView: UIView? {
//        get {
//            return (objc_getAssociatedObject(self, &AssociatedEffectiveKey.max) as? UIView)
//        }
//        set(newValue) {
//            objc_setAssociatedObject(self, &AssociatedEffectiveKey.max, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
//
//    open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        let view = super.hitTest(point, with: event)
//        if let _ = view, let maxView = maxEffectiveView {
//            let temPoint = maxView.convert(point , from: self)
//            if maxView.bounds.contains(temPoint) {
//                return maxView
//            }
//        }
//        return view
//    }
//}

extension UIControl {
    private struct AssociatedMaxHitRectKey {
        static var hitEdgeInsetKey = "hitEdgeInsetKey"
    }

    /// 有效边界
    /// - Note:
    ///     default zero, you can set UIEdgeInsets(-3,-4,-5,-6),
    ///     可以通过设置 UIEdgeInsets(-3,-4,-5,-6) ， 表示 扩大边界
    ///
    public var hitEdgeInsets: UIEdgeInsets {
        get {
            return (objc_getAssociatedObject(self, &AssociatedMaxHitRectKey.hitEdgeInsetKey) as? UIEdgeInsets) ?? UIEdgeInsets.zero
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedMaxHitRectKey.hitEdgeInsetKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }

    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if (UIEdgeInsetsEqualToEdgeInsets(self.hitEdgeInsets, UIEdgeInsets.zero) || !self.isEnabled || self.isHidden || self.alpha == 0 ) {
            return super.point(inside: point, with: event)
        } else {
            let relativeFrame = self.bounds
            let hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitEdgeInsets)
            return hitFrame.contains(point)
        }
    }
}
