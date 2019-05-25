//
//  UIAlertViewController+Ext.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/4/13.
//

import Foundation


extension TypeWrapperProtocol where WrappedType == UIAlertController {
    public static func alert(title : String?, message: String?,  cancel: String?,enter: String?, enterBlock:@escaping (() -> Void), cancelBlock:(()-> Void)?) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        if let c = cancel {
            alert.addAction(UIAlertAction.init(title: c, style: .cancel, handler: { (action) in
                cancelBlock?()
                alert.dismiss(animated: true, completion: nil)
            }))
        }

        alert.addAction(UIAlertAction.init(title: enter, style: .default, handler: { (action) in
            enterBlock()
            alert.dismiss(animated: true, completion: nil)
        }))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
