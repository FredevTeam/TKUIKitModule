//
//  UIAlertViewController+Ext.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/4/13.
//

import Foundation


// MARK: - UIAlertViewController
extension TypeWrapperProtocol where WrappedType : UIAlertController {

    /// 创建 alert View
    ///
    /// - Parameters:
    ///   - title: title
    ///   - message: message
    ///   - cancel: cancel button title
    ///   - enter: enter button title
    ///   - enterBlock: enter button aciton block
    ///   - cancelBlock: cancel button action block
    /// - Note:
    ///    默认情况下，是从 keyWindow 的 rootViewController 显示出来
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
