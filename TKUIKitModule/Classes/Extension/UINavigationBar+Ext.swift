//
//  UINavigationBar+Ext.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/1/25.
//

import Foundation


extension UINavigationBar {
    struct AssociatedKeys {
        static var backImage = "backImage"
        static var linClear = "linClear"
        static var navView = "navView"
        static var hiddenBottom = "hiddenBottom"
    }
    
    var backImage: UIImage? {
        get{
            guard let image =  objc_getAssociatedObject(self, &AssociatedKeys.backImage) as? UIImage else {
                return nil
            }
            return image
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.backImage, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var lineClearImage: UIImage? {
        get{
            guard let image =  objc_getAssociatedObject(self, &AssociatedKeys.linClear) as? UIImage else {
                return nil
            }
            return image
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.linClear, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    var navView:NavView? {
        get{
            guard let view  =  objc_getAssociatedObject(self, &AssociatedKeys.navView) as? NavView else {
                return nil
            }
            return view
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.navView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
    var hiddenBottom : Bool{
        get{
            
            return  objc_getAssociatedObject(self, &AssociatedKeys.hiddenBottom) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.hiddenBottom, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    fileprivate func clearSystemLayer(opaque: Bool) {
        if self.backImage == nil {
            self.backImage = UIImage()
            self.setBackgroundImage(self.backImage, for: .default)
        }
        self.barStyle = opaque ? .blackOpaque : .default
        // 去掉系统底线
        if self.lineClearImage == nil {
            self.lineClearImage = UIImage()
            self.shadowImage = self.lineClearImage
        }
    }
}

// MARK: - UINavigation Bar 
extension TypeWrapperProtocol where WrappedType == UINavigationBar {

    
     public func navBar(background color: UIColor, image: UIImage?, isOpaque: Bool = false) {
        self.wrappedValue.clearSystemLayer(opaque: isOpaque)
        if self.wrappedValue.navView == nil  {
            var statuHeight = UIApplication.shared.statusBarFrame.size.height
            if statuHeight == 0.0 {statuHeight = 20.0}
            let barHeight = self.wrappedValue.bounds.size.height
            var barBounds = self.wrappedValue.bounds
            barBounds.size.height = statuHeight + barHeight
            
            
            self.wrappedValue.navView = NavView(frame: barBounds)
            self.navBarBottomLine(hidden: self.wrappedValue.hiddenBottom)
        }
        self.wrappedValue.navView?.backColor = color
        self.wrappedValue.navView?.backImage = image
        //通过kvc找到系统导航栏背景层，把自定义层添加到背景层
        /*系统背景层无法改变其属性 所以通过添加自定义层，改变自定义层上的属性去实现效果*/
        let backView =  self.wrappedValue.value(forKey: "backgroundView") as? UIView
        backView?.addSubview(self.wrappedValue.navView!)
    }
    
    
    ///
    ///
    /// - Parameters:
    ///   - alpha: 透明度
    ///   - isOpaque: isOpaque
    public func navBar (alpha: CGFloat ,isOpaque: Bool =  false)  {
        self.wrappedValue.clearSystemLayer(opaque: isOpaque)
        if self.wrappedValue.navView == nil  {
            var statuHeight = UIApplication.shared.statusBarFrame.size.height
            if statuHeight == 0.0 {statuHeight = 20.0}
            let barHeight = self.wrappedValue.bounds.size.height
            var barBounds = self.wrappedValue.bounds
            barBounds.size.height = statuHeight + barHeight
            
            self.wrappedValue.navView = NavView(frame: barBounds)
            self.navBarBottomLine(hidden: self.wrappedValue.hiddenBottom)
        }
        
        self.wrappedValue.navView?.alpha = alpha
        let backView =  self.wrappedValue.value(forKey: "backgroundView") as? UIView
        backView?.addSubview(self.wrappedValue.navView!)
    }
    
    
    ///
    ///
    /// - Parameters:
    ///   - height: 高度
    ///   - isOpaque: isOpaque
    public func navBarLayer( height: CGFloat, isOpaque: Bool = false ) {
        var h = height
        h  = h  < 0 ? 0 : h
        self.wrappedValue.clearSystemLayer(opaque: isOpaque)
        
        if self.wrappedValue.navView == nil {
            self.wrappedValue.navView = NavView()
            self.navBarBottomLine(hidden: self.wrappedValue.hiddenBottom)
        }
        
        self.wrappedValue.navView?.frame = CGRect(x: 0, y: 0, width: self.wrappedValue.bounds.size.width, height: height)
        let backView =  self.wrappedValue.value(forKey: "backgroundView") as? UIView
        backView?.addSubview(self.wrappedValue.navView!)
        
    }
    
    
    
    
    /// 下划线
    ///
    /// - Parameter hidden: 是否隐藏
    public func navBarBottomLine(hidden: Bool = false)  {
        self.wrappedValue.hiddenBottom = hidden
        // 自定义图层
        if self.wrappedValue.navView != nil && self.wrappedValue.navView?.hiddenBottomLine != hidden {
            self.wrappedValue.navView?.hiddenBottomLine = hidden
        }else {
            if (hidden)  {
                if self.wrappedValue.lineClearImage == nil {
                    self.wrappedValue.lineClearImage = UIImage()
                    self.wrappedValue.shadowImage = self.wrappedValue.lineClearImage
                }
            }else {
                if self.wrappedValue.lineClearImage != nil {
                    self.wrappedValue.lineClearImage = nil
                    self.wrappedValue.shadowImage = self.wrappedValue.lineClearImage
                }
            }
        }
    }

    
    
    /// 还原为系统样式
    func navToSystem() {
        if self.wrappedValue.navView != nil {
            self.wrappedValue.navView?.removeFromSuperview()
            self.wrappedValue.navView = nil
        }
        if self.wrappedValue.lineClearImage != nil {
            self.wrappedValue.lineClearImage = nil
        }
        if self.wrappedValue.backImage != nil  {
            self.wrappedValue.backImage = nil
        }
        self.wrappedValue.setBackgroundImage(nil, for: .default)
        self.wrappedValue.shadowImage = nil
        self.wrappedValue.barStyle = .default
    }
    
}

class NavView : UIView {
    fileprivate var backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .top
        return imageView
    }()
    
    fileprivate var bottomLineView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.gray
        return v
    }()
    
    var hiddenBottomLine:Bool? = false  {
        didSet {
            self.bottomLineView.isHidden = hiddenBottomLine ?? false
        }
    }
    var backImage: UIImage? {
        didSet {
            self.backImageView.image = backImage
        }
    }
    var backColor: UIColor? {
        didSet {
            self.backImageView.backgroundColor = backColor
        }
    }
    
    fileprivate func installSubview(){
        let heigt = frame.size.height
        let width = frame.size.width
        self.backImageView.frame = CGRect(x: 0, y: 0, width: width, height: heigt)
        self.addSubview(self.backImageView)
        self.bottomLineView.frame = CGRect(x: 0, y: heigt - 0.5, width: width, height: 0.5)
        self .addSubview(self.bottomLineView)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var frame: CGRect {
        didSet {
            installSubview()
        }
        
    }
    
}

