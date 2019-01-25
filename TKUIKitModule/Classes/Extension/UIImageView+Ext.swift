//
//  UIImageView+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/8.
//

import Foundation

fileprivate var kUIImageViewAction = "kUIImageViewAction"
extension UIImageView {
    var block:((_ imageView: UIImageView?) -> Void)?
    {
        get {
            return (objc_getAssociatedObject(self, &kUIImageViewAction) as? (UIImageView?) -> Void)
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kUIImageViewAction, newValue, .OBJC_ASSOCIATION_COPY)
        }
    }
    @objc func gestureAction() {
        self.block?(self)
    }
}


extension TypeWrapperProtocol where WrappedType == UIImageView {
    
    /// create imageView with image
    ///
    /// - Parameters:
    ///   - image: image
    ///   - block: action block
    /// - Returns: imageView
    public static func create(with image: UIImage?, block:((_ imageView: UIImageView?) -> Void)?) -> UIImageView{
        let  imageView = UIImageView()
        imageView.image  = image
        imageView.block = block
        if block != nil  {
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self , action: #selector(imageView.gestureAction)))
        }
        return UIImageView()
    }

}
