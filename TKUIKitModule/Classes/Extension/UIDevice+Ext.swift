//
//  UIDevice+Ext.swift
//  TKUIKitModule
//
//  Created by 聂子 on 2019/1/27.
//

import Foundation
import CoreTelephony
import UIKit
private class DeviceID {
}

///  设备枚举
public enum Hardware {
    
    case UNKNOWN
    
    case IPHONE_2G
    case IPHONE_3G
    case IPHONE_3GS
    case IPHONE_4
    case IPHONE_4_CDMA
    case IPHONE_4S
    case IPHONE_5
    case IPHONE_5_CDMN_GSM
    case IPHONE_5C
    case IPHONE_5C_CDMN_GSM
    case IPHONE_5S
    case IPHONE_5S_CDMN_GSM
    case IPHONE_6
    case IPHONE_6_PLUS
    case IPHONE_6S
    case IPHONE_6S_PLUS
    case IPHONE_SE
    case IPHONE_7
    case IPHONE_7_PLUS
    case IPHONE_8
    case IPHONE_8_PLUS
    case IPHONE_X
    case IPHONE_XS
    case IPHONE_XS_MAX
    case IPHONE_XS_MAX_CHINA
    case IPHONE_XR
    
    case IPOD_1
    case IPOD_2
    case IPOD_3
    case IPOD_4
    case IPOD_5
    case IPOD_6
    
    case IPAD_1
    case IPAD_1_3G
    case IPAD_2
    case IPAD_2_WIFI
    case IPAD_2_CDMA
    case IPAD_3
    case IPAD_3_GLOBAL
    case IPAD_3_WIFI
    case IPAD_3_WIFI_CDMA
    case IPAD_4
    case IPAD_4_GLOBAL
    case IPAD_4_WIFI
    case IPAD_4_CDMA
    case IPAD_5_WIFI
    case IPAD_5_WIFI_CELLULAR
    
    case IPADAIR_WIFI
    case IPADAIR_WIFI_GSM
    case IPADAIR_WIFI_CDMA
    case IPADAIR2_WIFI
    case IPADAIR2_WIFI_CELLULAR
}

fileprivate let DeviceListName = "DeviceList"

// MARK: - UIDevice basic
extension TypeWrapperProtocol where WrappedType : UIDevice {
    public static func uuid() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    public static func systemName() -> String {
        return UIDevice.current.systemName
    }
    public static func systemVersion() -> String {
        return UIDevice.current.systemVersion
    }
    public static func deviceName() -> String {
        return UIDevice.current.name
    }
    public static func deviceLanguage() -> String? {
        return Locale.preferredLanguages.first
    }
    public static func deviceCountry() -> String? {
        return Locale.current.identifier
    }
    public static func deviceCurrency() -> String? {
        return Locale.current.currencySymbol
    }
    public static func deviceTimeZone() -> String? {
        return TimeZone.current.identifier
    }
    public static func isPhone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    public static func isPod() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    public static func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    @available(iOS 9.0, *)
    public static func isTV() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .tv
    }
    @available(iOS 9.0, *)
    public static func isCarPlay() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .carPlay
    }

    public static func systemUptime() -> String? {
        let time = ProcessInfo.processInfo.systemUptime
        let components = Calendar.current.dateComponents([.day,.hour,.minute], from: Date.init(timeIntervalSinceNow: -time), to: Date.init())
        if let day = components.day, let hour = components.hour, let minute = components.minute {
            return "\(day) \(hour) \(minute)"
        }
        return nil
    }

}

// MARK: - UIDevice model hardware
extension TypeWrapperProtocol where WrappedType : UIDevice {
    /// https://stackoverflow.com/questions/26028918/how-to-determine-the-current-iphone-device-model
    /// model name
    ///
    /// - Returns: model name
    fileprivate static func modelName() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror.init(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    
    
    /// mdoel name
    ///
    /// - Returns: string
    fileprivate static func modelName2() -> String {
        var size:Int = 2
        sysctlbyname("", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0, count: size)
        sysctlbyname("", &machine, &size, nil, 0)
        let model = String.init(cString: machine, encoding: String.Encoding.utf8)
        return model!
    }
    
    
    /// 设备类型
    ///
    /// - Returns: enum
    public static func hardware() -> Hardware {
        let hardware = self.modelName()
        
        if (hardware == "iPhone1,1")  { return .IPHONE_2G }
        if (hardware == "iPhone1,2")  { return .IPHONE_3G }
        if (hardware == "iPhone2,1")  { return .IPHONE_3GS }
        if (hardware == "iPhone3,1")  { return .IPHONE_4 }
        if (hardware == "iPhone3,2")  { return .IPHONE_4 }
        if (hardware == "iPhone3,3")  { return .IPHONE_4_CDMA }
        if (hardware == "iPhone4,1")  { return .IPHONE_4S }
        if (hardware == "iPhone5,1")  { return .IPHONE_5 }
        if (hardware == "iPhone5,2")  { return .IPHONE_5_CDMN_GSM }
        if (hardware == "iPhone5,3")  { return .IPHONE_5C }
        if (hardware == "iPhone5,4")  { return .IPHONE_5C_CDMN_GSM }
        if (hardware == "iPhone6,1")  { return .IPHONE_5S }
        if (hardware == "iPhone6,2")  { return .IPHONE_5S_CDMN_GSM }
        if (hardware == "iPhone7,1")  { return .IPHONE_6_PLUS }
        if (hardware == "iPhone7,2")  { return .IPHONE_6 }
        if (hardware == "iPhone8,1")  { return .IPHONE_6S }
        if (hardware == "iPhone8,2")  { return .IPHONE_6S_PLUS }
        if (hardware == "iPhone8,4")  { return .IPHONE_SE }
        if (hardware == "iPhone9,1")  { return .IPHONE_7 }
        if (hardware == "iPhone9,2")  { return .IPHONE_7_PLUS }
        if (hardware == "iPhone9,3")  { return .IPHONE_7 }
        if (hardware == "iPhone9,4")  { return .IPHONE_7_PLUS }
        if (hardware == "iPhone10,1")  { return .IPHONE_8 }
        if (hardware == "iPhone10,2")  { return .IPHONE_8_PLUS }
        if (hardware == "iPhone10,3")  { return .IPHONE_X }
        if (hardware == "iPhone10,4")  { return .IPHONE_8 }
        if (hardware == "iPhone10,5")  { return .IPHONE_8_PLUS }
        if (hardware == "iPhone10,6")  { return .IPHONE_X }
        if (hardware == "iPhone11,2")  { return .IPHONE_XS }
        if (hardware == "iPhone11,4")  { return .IPHONE_XS_MAX }
        if (hardware == "iPhone11,6")  { return .IPHONE_XS_MAX_CHINA }
        if (hardware == "iPhone11,8")  { return .IPHONE_XR }
        if (hardware == "iPod1,1")    { return .IPOD_1 }
        if (hardware == "iPod2,1")    { return .IPOD_2 }
        if (hardware == "iPod3,1")    { return .IPOD_3 }
        if (hardware == "iPod4,1")    { return .IPOD_4 }
        if (hardware == "iPod5,1")    { return .IPOD_5 }
        if (hardware == "iPod7,1")    { return .IPOD_6 }
        if (hardware == "iPad1,1")    { return .IPAD_1 }
        if (hardware == "iPad1,2")    { return .IPAD_1_3G }

        if (hardware == "iPad2,1")    { return .IPAD_2_WIFI }
        if (hardware == "iPad2,2")    { return .IPAD_2 }
        if (hardware == "iPad2,3")    { return .IPAD_2_CDMA }
        if (hardware == "iPad2,4")    { return .IPAD_2 }
//        if (hardware == "iPad2,5")    { return .ipadMini_wifi }
//        if (hardware == "iPad2,6")    { return .ipadMini }
//        if (hardware == "iPad2,7")    { return .ipadMini_wifi_cdma }
//
        if (hardware == "iPad3,1")    { return .IPAD_3_WIFI }
        if (hardware == "iPad3,2")    { return .IPAD_3_WIFI_CDMA }
        if (hardware == "iPad3,3")    { return .IPAD_3 }
        if (hardware == "iPad3,4")    { return .IPAD_4_WIFI }
        if (hardware == "iPad3,5")    { return .IPAD_4 }
        if (hardware == "iPad3,6")    { return .IPAD_4_GLOBAL }
//
//        if (hardware == "iPad4,1")    { return .ipadAir_wifi }
//        if (hardware == "iPad4,2")    { return .ipadAir_wifi_gsm }
//        if (hardware == "iPad4,3")    { return .ipadAir_wifi_cdma }
//        if (hardware == "iPad4,4")    { return .ipadMiniRetina_wifi }
//        if (hardware == "iPad4,5")    { return .ipadMiniRetina_wifi_cdma }
//        if (hardware == "iPad4,6")    { return .ipadMiniRetina_wifi_cellular_cn }
//        if (hardware == "iPad4,7")    { return .ipadMini3_wifi }
//        if (hardware == "iPad4,8")    { return .ipadMini3_wifi_cellular }
//        if (hardware == "iPad4,9")    { return .ipadMini3_wifi_cellular_cn }
//
//        if (hardware == "iPad5,1")    { return .ipadMini4_wifi }
//        if (hardware == "iPad5,2")    { return .ipadMini4_wifi_cellular }
//        if (hardware == "iPad5,3")    { return .ipadAir2_wifi }
//        if (hardware == "iPad5,4")    { return .ipadAir2_wifi_cellular }
//
//        if (hardware == "iPad6,3")    { return .ipadPro_97_wifi }
//        if (hardware == "iPad6,4")    { return .ipadPro_97_wifi_cellular }
//        if (hardware == "iPad6,7")    { return .ipadPro_wifi }
//        if (hardware == "iPad6,8")    { return .ipadPro_wifi_cellular }
//        if (hardware == "iPad6,11")   { return .ipad5_wifi }
//        if (hardware == "iPad6,12")   { return .ipad5_wifi_cellular }
//
//        if (hardware == "iPad7,1")    { return .ipadPro2g_wifi }
//        if (hardware == "iPad7,2")    { return .ipadPro2g_wifi_cellular }
//        if (hardware == "iPad7,3")    { return .ipadPro_105_wifi }
//        if (hardware == "iPad7,4")    { return .ipadPro_105_wifi_cellular }
//        if (hardware == "iPad7,5")    { return .ipad6_wifi }
//        if (hardware == "iPad7,6")    { return .ipad6_wifi_cellular }
//
//        if (hardware == "iPad8,1")    { return .ipad_pro_11_wifi }
//        if (hardware == "iPad8,2")    { return .ipad_pro_11_1tb_wifi }
//        if (hardware == "iPad8,3")    { return .ipad_pro_11_wifi_cellular }
//        if (hardware == "iPad8,4")    { return .ipad_pro_11_1tb_wifi_cellular }
//
//        if (hardware == "iPad8,5")    { return .ipad_pro_3g_wifi }
//        if (hardware == "iPad8,6")    { return .ipad_pro_3g_1tb_wifi }
//        if (hardware == "iPad8,7")    { return .ipad_pro_3g_wifi_cellular }
//        if (hardware == "iPad8,8")    { return .ipad_pro_3g_1tb_wifi_cellular }
//
//        if (hardware == "AppleTV1,1")  { return .appleTv1g }
//        if (hardware == "AppleTV2,1")  { return .appleTv2g }
//        if (hardware == "AppleTV3,1")  { return .appleTv3g_2012 }
//        if (hardware == "AppleTV3,2")  { return .appleTv3g_2013 }
//        if (hardware == "AppleTV5,3")  { return .appleTv4g }
//
//        if (hardware == "Watch1,1")   { return .appleWatch_38 }
//        if (hardware == "Watch1,2")   { return .appleWatch_42 }
//        if (hardware == "Watch2,3")   { return .appleWatch_series_2_38 }
//        if (hardware == "Watch2,4")   { return .appleWatch_series_2_42 }
//        if (hardware == "Watch2,6")   { return .appleWatch_series_1_38 }
//        if (hardware == "Watch2,7")   { return .appleWatch_series_1_42 }
//        if (hardware == "Watch3,1")   { return .appleWatch_series_3_38_cellular }
//        if (hardware == "Watch3,2")   { return .appleWatch_series_3_42_cellular }
//        if (hardware == "Watch3,3")   { return .appleWatch_series_3_38 }
//        if (hardware == "Watch3,4")   { return .appleWatch_series_3_42 }
//        if (hardware == "Watch4,1")   { return .appleWatch_series_4_40 }
//        if (hardware == "Watch4,2")   { return .appleWatch_series_4_44 }
//        if (hardware == "Watch4,3")   { return .appleWatch_series_4_40_cellular}
//        if (hardware == "Watch4,4")   { return .appleWatch_series_4_44_cellular};
//
//        if (hardware == "i386")       { return .simulator }
//        if (hardware == "x86_64")     { return .simulator }
        return .UNKNOWN
    }
    
    /// device List  DeviceList.plist from
    /// https://github.com/InderKumarRathore/DeviceGuru
    /// - Returns: Dic
    fileprivate static func deviceList() -> [String: AnyObject]? {
        let bundle = Bundle.init(for: DeviceID.self)
        // bundle Name
        guard let bundleName = bundle.infoDictionary?[kCFBundleNameKey as String] as? String else {
            debugPrint("bundle name is nil for \(bundle)")
            return nil
        }
        // bundler name + .bundle
        let bundleDic = bundleName + ".bundle"
        guard let path = bundle.path(forResource: DeviceListName, ofType: "plist", inDirectory: bundleDic) else {
            debugPrint("\(DeviceListName) file is not found from \(bundleDic)")
            return nil
        }
        return NSDictionary.init(contentsOfFile: path) as? [String: AnyObject]
    }
    
    
    
    /// hardware string
    ///
    /// - Returns: string
    public static func hardwareName() -> String? {
        let hardware = modelName()
        if let list = deviceList() {
            let message = list[hardware] as? [String: AnyObject]
            if let desc = message?["name"] {
                return desc as? String
            }
        }
        return nil
    }
    
    /// 输出所有支持的设备
    public static func hardwareDescription() {
        debugPrint("Device List:\(String(describing: deviceList()))")
    }
}






// MARK: - Device carrier infomation
extension TypeWrapperProtocol where WrappedType : UIDevice {

    public static  func carrierName() -> String? {
        return CTTelephonyNetworkInfo.init().subscriberCellularProvider?.carrierName
    }
    public static func carrierCountryCode() -> String? {
        return CTTelephonyNetworkInfo.init().subscriberCellularProvider?.mobileCountryCode
    }
    public static func carrierISOCountryCode() -> String? {
        return CTTelephonyNetworkInfo.init().subscriberCellularProvider?.isoCountryCode
    }

    public static func allowsVOIP() -> Bool {
        return CTTelephonyNetworkInfo.init().subscriberCellularProvider?.allowsVOIP ?? false
    }
}




