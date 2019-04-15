//
//  UIAlertViewController+Ext.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/4/13.
//

import Foundation


extension TypeWrapperProtocol where WrappedType == UIAlertController {
    public static func alert(title : String?, message: String?,  cancel: String?,enter: String?, enterBlock:@escaping (() -> Void), cancelBlock:(()-> Void)?) -> UIAlertController {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: cancel, style: .cancel, handler: { (action) in
            cancelBlock?()
        }))
        
        alert.addAction(UIAlertAction.init(title: enter, style: .default, handler: { (action) in
            enterBlock()
        }))
        return alert
    }
}
