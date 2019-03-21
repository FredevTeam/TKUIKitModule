//
//  UIApplication+Ext.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/21.
//

import Foundation
import StoreKit
import AdSupport

public enum JumpAppStoreType {
    @available(iOS 10.3, *)
    case app
    // app store
    case store
}

extension TypeWrapperProtocol where WrappedType == UIApplication {

    /// 跳转 app store 下载界面
    ///
    /// - Parameters:
    ///   - appId: APP id
    ///   - type: type
    public static func openAppStore(with appId: String, with type: JumpAppStoreType) {
        assert(appId.isEmpty == false)
        switch type {
        case .store:
            if let url = URL.init(string: "https://itunes.apple.com/app/id\(appId)") {
                if UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        // Fallback on earlier versions
                        UIApplication.shared.openURL(url)
                    }
                }
            }
        case .app:
            fallthrough
        default:
            if #available(iOS 10.3, *) {
                let storeVC = SKStoreProductViewController.init()
                storeVC.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier : appId]) { (result, error) in
                    if result {
                        UIApplication.shared.keyWindow?.rootViewController?.present(storeVC, animated: true, completion: nil)
                    }else {
                        print("\(String(describing: error?.localizedDescription))")
                    }
                }
            }else {
                print("Less than 10.3 version does not support opening the Appstore preview page within app")
            }
        }
    }
    
    
    /// 评论界面
    ///
    /// - Parameters:
    ///   - appId: app ID
    ///   - type: 类型
    public static func openAppReview(with appId: String, with type: JumpAppStoreType) {
        assert(appId.isEmpty == false)
        switch type {
        case .store:
            if let url = URL.init(string: "itms-apps://itunes.apple.com/app/viewContentsUserReviews?id=\(appId)") {
                if UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        // Fallback on earlier versions
                        UIApplication.shared.openURL(url)
                    }
                }
            }
        case .app:
            fallthrough
        default:
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            }else {
                print("Less than 10.3 version does not support opening the Appstore preview page within app")
            }
        }
    }
}

extension TypeWrapperProtocol where WrappedType == UIApplication {
    
    /// version
    ///
    /// - Returns: version
    public static func version() -> String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    /// language
    ///
    /// - Returns: language
    public static func language() -> String? {
        return Bundle.main.preferredLocalizations.first
    }
    
    
    /// idfa
    ///
    /// - Returns: idfa
    public static func idfa() -> String? {
        if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
            return ASIdentifierManager.shared().advertisingIdentifier.uuidString
        }
        return nil
    }

}
