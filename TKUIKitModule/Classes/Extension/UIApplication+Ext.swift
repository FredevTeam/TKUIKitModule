//
//  UIApplication+Ext.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/3/21.
//

import Foundation
import StoreKit
import AdSupport
import UIKit

/// 跳转模式
///
/// - app: app 内部跳转
/// - store: 直接跳转到 app store
public enum JumpAppStoreType {
    @available(iOS 10.3, *)
    case app
    // app store
    case store
}


// MARK: - UIApplication open store and review
extension TypeWrapperProtocol where WrappedType : UIApplication {

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


// MARK: - UIApplication basic
extension TypeWrapperProtocol where WrappedType : UIApplication {
    
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

extension UIApplication: NamespaceWrappable{}
let infoDic = Bundle.main.infoDictionary

// MARK: - UIApplicaiton base property
extension TypeWrapperProtocol where WrappedType : UIApplication {

    /// version
    var version: String {
        return (infoDic?["CFBundleShortVersionString"] as? String) ?? ""
    }

    /// build version
    var buildVersion: String {
        return (infoDic?["CFBundleVersion"] as? String) ?? ""
    }

    /// name
    var name: String {
        return (infoDic?["CFBundleDisplayName"] as? String) ?? ""
    }

    ///  identifier
    var identifier: String {
        return (infoDic?["CFBundleIdentifier"] as? String) ?? ""
    }

    /// namespace
    var namespace: String {
        return  (infoDic?["CFBundleExecutable"] as? String) ?? ""
    }
}
