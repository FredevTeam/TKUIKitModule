//
//  UIImage+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/11/9.
//

import Foundation
import CoreGraphics
import UIKit

extension UIImage {
    public enum Direction {
        case horizontal
        case vertical
    }
}

extension UIImage : NamespaceWrappable{}

// MARK: - UIImage 
extension TypeWrapperProtocol where WrappedType : UIImage {
    
    /// 通过颜色生成UIImage
    ///
    /// - Parameter color: uicolor
    /// - Returns: UIImage
    public static func create(with color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage!
    }

    /// 通过颜色创建图片
    ///
    /// - Parameters:
    ///   - color: 颜色
    ///   - size: 大小
    ///   - cornerRadius: 圆角
    /// - Returns: UIImage
    public static func create(with color: UIColor, size: CGSize?, cornerRadius:CGFloat = 0) -> UIImage? {
        let rect = CGRect.init(origin: .zero, size: size ?? CGSize.init(width: 1.0, height: 1.0))
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        let path = UIBezierPath.init(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: CGSize.init(width: cornerRadius, height: cornerRadius))
        context.addPath(path.cgPath)
        context.setFillColor(color.cgColor)
        context.drawPath(using: .fill)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage
    }

    
    
    /// 针对图片进行缩放
    ///
    /// - Parameter size: 缩放大小
    /// - Returns: 图片 UIImage
    public func scaleWith(size : CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        self.wrappedValue.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 根据width 进行缩放
    ///
    /// - Parameter width: 给定宽度
    /// - Returns: UIImage
    public func scaleWith(width: CGFloat) -> UIImage? {
        let height = (width / self.wrappedValue.size.width) * self.wrappedValue.size.height
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height),  false , 0)
        self.wrappedValue.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 根据 height 进行缩放
    ///
    /// - Parameter height: 给定高度
    /// - Returns: UIImage
    public func scale(height: CGFloat) -> UIImage? {
        let width = (height / self.wrappedValue.size.height) * self.wrappedValue.size.width
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height),  false , 0)
        self.wrappedValue.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    
    /// 裁剪圆形图片
    ///
    /// - Returns: UIImage
    public func circle() -> UIImage? {
        // 获取上下文  false 代表透明度
        UIGraphicsBeginImageContextWithOptions(self.wrappedValue.size, false, 0)
        let context  = UIGraphicsGetCurrentContext()
        // 添加圆
        let rect = CGRect(x: 0, y: 0, width: self.wrappedValue.size.width, height: self.wrappedValue.size.height)
        context?.addEllipse(in: rect)
        
        // 裁剪
        context?.clip()
        
        // 绘制
        self.wrappedValue.draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    
    
   /// 从 view 生成图片
   ///
   /// - Parameter view: 目标view
   /// - Returns: UIImage
   public static func createImageWith (view: UIView) -> UIImage? {
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContext(view.bounds.size)
        let context = UIGraphicsGetCurrentContext()
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, scale)
    
        // 将view 上的子view 添加进来
        view.layer.render(in: context!)
        context?.restoreGState()
    
        // 开始生成图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    
    /// 截取图片中的部分
    ///
    /// - Parameter rect: 目标 rect
    /// - Returns: UIImage
    public func cutWith(rect: CGRect) -> UIImage? {
        let imageRef = self.wrappedValue.cgImage?.cropping(to: rect)
        if imageRef == nil {
            return nil
        }
        let image = UIImage(cgImage: imageRef!, scale: self.wrappedValue.scale, orientation: self.wrappedValue.imageOrientation)
        return image
    }
    
    
    /// 添加文字水印
    ///
    /// - Parameters:
    ///   - text: 文字内容
    ///   - rect: 水印 rect
    ///   - size: 文字大小
    ///   - color: 文字颜色
    /// - Returns: UIImage
    public func watermarkWith(text: String, with rect: CGRect,font size: Float, color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContext(self.wrappedValue.size)
        self.wrappedValue.draw(in: CGRect(x: 0, y: 0, width: self.wrappedValue.size.width, height: self.wrappedValue.size.height))
        NSString(string: text).draw(in: rect, withAttributes: [NSAttributedString.Key.foregroundColor : color,
                                                               NSAttributedString.Key.font: UIFont.systemFont(ofSize: CGFloat(size))])
        let image =  UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    
    /// 添加图片水印
    ///
    /// - Parameters:
    ///   - image: 水印图片
    ///   - rect: 水印 rect
    /// - Returns: UIImage
    public func watermarkWith(image: UIImage, with rect: CGRect) -> UIImage? {
        UIGraphicsBeginImageContext(self.wrappedValue.size)
        self.wrappedValue.draw(in: CGRect(x: 0, y: 0, width: self.wrappedValue.size.width, height: self.wrappedValue.size.height))
        image.draw(in: rect)
        let m = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return m
    }
    
    
    
    /// 修正方向
    ///
    /// - Returns: UIImage
    public func fixOrientation() -> UIImage {
        if self.wrappedValue.imageOrientation == .up {
            return self.wrappedValue
        }
        
        let transform = CGAffineTransform.identity
        switch self.wrappedValue.imageOrientation {
        case .down:
            fallthrough
        case .downMirrored:
            transform.translatedBy(x: self.wrappedValue.size.width, y: self.wrappedValue.size.height)
            transform.rotated(by: CGFloat(Double.pi))
            
        case .left:
            fallthrough
        case .leftMirrored:
            transform.translatedBy(x: self.wrappedValue.size.width, y: 0)
            transform.rotated(by: CGFloat(Double.pi / 2))
        case .right:
            fallthrough
        case .rightMirrored:
            transform.translatedBy(x: 0, y: self.wrappedValue.size.height)
            transform.rotated(by: -CGFloat(Double.pi / 2))
        default:
            break
        }
        
        
        switch self.wrappedValue.imageOrientation {
        case .upMirrored:
            fallthrough
        case .downMirrored:
            transform.translatedBy(x: self.wrappedValue.size.width, y: 0)
            transform.scaledBy(x: -1, y: -1)
        case .rightMirrored:
            fallthrough
        case .leftMirrored:
            transform.translatedBy(x: self.wrappedValue.size.height, y: 0)
            transform.scaledBy(x: -1, y: -1)
        default:
            break
        }
        
        // 获取context
        guard let context = CGContext.init(data: nil, width: Int(self.wrappedValue.size.width), height: Int(self.wrappedValue.size.height), bitsPerComponent: (self.wrappedValue.cgImage?.bitsPerComponent) ?? 0, bytesPerRow: 0, space: (self.wrappedValue.cgImage?.colorSpace)!, bitmapInfo: (self.wrappedValue.cgImage?.bitmapInfo)!.rawValue) else {
                debugPrint("create context fail")
            return self.wrappedValue
        }
        
        if self.wrappedValue.cgImage == nil  {
            debugPrint("=====self cgimage nil")
            return self.wrappedValue
        }
        
        context.draw(self.wrappedValue.cgImage!, in: CGRect(x: 0, y: 0, width: self.wrappedValue.size.width, height: self.wrappedValue.size.height), byTiling: false)
        let cgimage = CGContext.makeImage(context)
        let image = UIImage(cgImage: cgimage as! CGImage)
        return image
    }
    
    
    /// 创建渐变图片
    ///
    /// - Parameters:
    ///   - size: 大小
    ///   - locations: 渐变关键点位置数组
    ///   - colors: 渐变颜色数组
    /// - Returns: 图片
    public static func createGradientImage(_ size:CGSize,_ locations:[CGFloat],_ colors:[CGColor]) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        guard let colorGradient =  CGGradient.init(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations) else {
            return nil
        }
        let startPoint = CGPoint.init(x: size.width, y: 0)
        let endPoint = CGPoint(x: size.width, y: size.height)
        context?.drawLinearGradient(colorGradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    

    
    /// 根据颜色组，绘画出渐变的图片来
    ///
    /// - Parameter gradientColors: 渐变颜色组
    ///             direction: 方向，水平或垂直
    public static func createGradient(with gradientColors:[UIColor], direction: UIImage.Direction = .horizontal) -> UIImage? {

        let endPoint: CGPoint = direction == .horizontal ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 1)

        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1) , true, 0)
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let cgColors = gradientColors.map { $0.cgColor }
        let gradient = CGGradient(colorsSpace: colorSpace, colors: cgColors as CFArray, locations: nil)
        context?.drawLinearGradient(gradient!,
                                    start: CGPoint(x: 0, y: 0),
                                    end: endPoint,
                                    options: CGGradientDrawingOptions(rawValue: 0))
        let cgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage!
        UIGraphicsEndImageContext()
        guard cgImage != nil  else {
            return nil
        }
        return UIImage(cgImage: cgImage!)
    }


    /// 根据 path 绘制 渐变图形
    ///
    /// - Parameters:
    ///   - colors: 颜色数组
    ///   - path: path 路径
    ///   - size: size 大小
    ///   - direction: 渐变方向
    /// - Returns: UIImage
    public static func gradient(with colors:[UIColor],path: UIBezierPath?, size:CGSize, direction: UIImage.Direction = .horizontal) -> UIImage?{
        let shaperLayer = CAShapeLayer.init()
        let  gradientColors = colors.map { (color) -> CGColor in
            return color.cgColor
        }
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        if let path = path {
            shaperLayer.path = path.cgPath
        }
        shaperLayer.frame = CGRect.init(origin: .zero, size: size)
        if direction == .horizontal{
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint   = CGPoint(x: 1, y: 0)
            gradientLayer.frame = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        }else{
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint   = CGPoint(x: 0, y: 1)
            gradientLayer.frame = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        }
        UIGraphicsBeginImageContextWithOptions(gradientLayer.bounds.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        gradientLayer.mask = shaperLayer
        gradientLayer.render(in: context)
        guard let  image = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        UIGraphicsEndImageContext()
        return image
    }
//    /// 用CGContext绘制一张图形到原来的图片中
//    ///
//    /// - parameter block: 绘制block
//    ///
//    /// - returns: 生成的新图
//    public func drawGraphics(with block:(CGContext,CGRect) -> Void) -> UIImage? {
//        
//        let size = self.size
//        let rect = CGRect(x:0, y:0, width:size.width, height:size.height)
//        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
//        self.draw(at: CGPoint.zero)
//        let context: CGContext = UIGraphicsGetCurrentContext()!
//        block(context,rect)
//        
//        let image = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        
//        return image;
//    }
//    
//    /**
//     用CGContextRef代码生成一个UIImage图片对象
//     
//     - parameter size:         图片大小
//     - parameter drawingBlock: 绘画block
//     
//     - returns: 生成的图片
//     */
//    public class func image(size: CGSize, drawingBlock:(CGContext,CGRect) -> Void) -> UIImage? {
//        
//        guard size.equalTo(CGSize()) == false else {
//            return nil
//        }
//        
//        let rect = CGRect(x:0, y:0, width:size.width, height:size.height)
//        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
//        let context: CGContext = UIGraphicsGetCurrentContext()!
//        context.clear(rect)
//        
//        drawingBlock(context,rect)
//        
//        let image = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        
//        return image;
//    }
//    
    
    
}



extension TypeWrapperProtocol where WrappedType : UIImage {
    
    /// 获取image
    ///
    /// - Parameters:
    ///   - name: name
    ///   - bundleClass: bundle class
    ///   - type: type
    ///   - enable: scale enable
    /// - Returns: uiimage
    public static func image(name : String,
                             in bundleClass: AnyClass,
                             type: String? = nil,
                             scale enable: Bool = false) -> UIImage? {
        
        let bundle = Bundle.init(for: bundleClass)
        // bundle Name
        guard let bundleName = bundle.infoDictionary?[kCFBundleNameKey as String] as? String,
            let url = bundle.url(forResource: bundleName, withExtension: "bundle"),
            let resourceBundle = Bundle(url: url)
            else { return nil }
        
        // bundler name + .bundle
        var imageName = name
        if enable {
            imageName = name + "@\(Int(UIScreen.main.scale))x"
        }
        return UIImage(named: imageName, in: resourceBundle, compatibleWith: nil)
    }

    
}



extension TypeWrapperProtocol where WrappedType : UIImage {
    
    /// 重置size
    ///
    /// - Parameter size: size
    /// - Returns: uiimage
    public func reset(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        wrappedValue.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    
    /// 根据宽度缩放
    ///
    /// - Parameter withwidth: 宽度
    /// - Returns: image
    public func scale(withwidth: CGFloat) -> UIImage? {
        let ratio = wrappedValue.size.width / withwidth
        let newSize = CGSize.init(width: wrappedValue.size.width / ratio, height: wrappedValue.size.height / ratio)
        return self.reset(size: newSize)
    }
    
    
    /// 根据高度缩放
    ///
    /// - Parameter withheight: 高度
    /// - Returns: image
    public func scale(withheight: CGFloat) -> UIImage? {
        let ratio = wrappedValue.size.height / withheight
        let newSize = CGSize.init(width: wrappedValue.size.width / ratio, height: wrappedValue.size.height / ratio)
        return self.reset(size: newSize)
    }
    
    
    /// 按比例缩放
    ///
    /// - Parameter proportion: 比例  0 ~ 1 之间
    /// - Returns: image
    public func scale(with proportion:CGFloat) -> UIImage? {
        if proportion > 1 || proportion < 0 {
            debugPrint("proportion is need 0 ~ 1")
            return nil
        }
        return self.reset(size: CGSize.init(width: wrappedValue.size.width * proportion, height: wrappedValue.size.height * proportion))
    }
    
    
    /// 压缩图片
    ///
    /// - Parameter quality: 压缩比例
    /// - Returns: 图片
    public func compress(with quality:CGFloat) -> UIImage? {
        if let data = self.wrappedValue.jpegData(compressionQuality: quality) {
            return UIImage.init(data: data)
        }
        return nil
    }
    
    /// 裁剪
    ///
    /// - Parameter bound: 大小
    /// - Returns: image
    public func cropped(bound: CGRect) -> UIImage? {
        guard bound.origin.x < wrappedValue.size.width else {
            debugPrint("cropping X need larger image width")
            return nil
        }
        
        guard bound.origin.y < wrappedValue.size.height else {
            debugPrint("cropping Y need larger image height")
            return  nil
        }
        
        let scaled = CGRect.init(x: bound.origin.x * wrappedValue.scale,
                                 y: bound.origin.y * wrappedValue.scale,
                                 width: bound.size.width * wrappedValue.scale,
                                 height: bound.size.height * wrappedValue.scale)
        
        let imageRef = wrappedValue.cgImage?.cropping(to: scaled)
        if imageRef == nil  {
            return nil
        }
        return UIImage.init(cgImage: imageRef!, scale: wrappedValue.scale, orientation: UIImage.Orientation.up)
    }
    
    
    /// bytes
    ///
    /// - Returns: bytes number
    public func bytes() -> Int {
        return wrappedValue.jpegData(compressionQuality: 1)?.count ?? 0
    }
    
    /// 大小 kb
    ///
    /// - Returns: size
    public func size() -> Int {
        let btyes = self.bytes()
        return btyes / 1024
    }
    
    
    /// base 64
    public var base64: String? {
        return wrappedValue.jpegData(compressionQuality: 1.0)?.base64EncodedString()
    }
}










