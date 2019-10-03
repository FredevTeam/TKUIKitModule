//
//  UIImage+PHAsset.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/11/10.
//

import Foundation
import Photos


// MARK: -  UIImage iCloud 
extension TypeWrapperProtocol where WrappedType == UIImage {
    
    /// 请求 iCloud中的图片
    ///
    /// - Parameters:
    ///   - asset: asset 资源对象
    ///   - size: 图片大小
    ///   - mode: 模式
    ///   - completion: 回调block
    @available(iOS 9.1, *)
    public static func reqeustImage(for asset:PHAsset, size : CGSize, resize mode: PHImageRequestOptionsResizeMode ,completion:@escaping (_ image: UIImage?, _ dic : [AnyHashable:Any]?) -> Void) {
        let reqeustId:PHImageRequestID = -1
        let width = min(UIScreen.main.bounds.width, 500)
        let scale = UIScreen.main.scale
        if reqeustId >= 1 && size.width/width == scale {
            PHCachingImageManager.default().cancelImageRequest(reqeustId)
        }
        let option = PHImageRequestOptions()
        /*
        resizeMode：对请求的图像怎样缩放。有三种选择：None，默认加载方式；Fast，尽快地提供接近或稍微大于要求的尺寸；Exact，精准提供要求的尺寸。
        deliveryMode：图像质量。有三种值：Opportunistic，在速度与质量中均衡；HighQualityFormat，不管花费多长时间，提供高质量图像；FastFormat，以最快速度提供好的质量。
        这个属性只有在 synchronous 为 true 时有效。
        */
        option.resizeMode = mode
        //option.deliveryMode = PHImageRequestOptionsDeliveryModeOpportunistic;//控制照片质量
        option.isNetworkAccessAllowed = true
        /*
         info字典提供请求状态信息:
         PHImageResultIsInCloudKey：图像是否必须从iCloud请求
         PHImageResultIsDegradedKey：当前UIImage是否是低质量的，这个可以实现给用户先显示一个预览图
         PHImageResultRequestIDKey和PHImageCancelledKey：请求ID以及请求是否已经被取消
         PHImageErrorKey：如果没有图像，字典内的错误信息
         */
        
        PHCachingImageManager.default().requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFit, options: option) { (image , dic ) in
            if dic != nil {
                let canceled = dic![PHImageCancelledKey] as? Bool ?? false
                let error = dic![PHImageErrorKey] as? Bool ?? false
                
                if (!canceled && !error) {
                    completion(image, dic)
                }
            }
        }
    }
    
    
    /// 从 iCloud 获取 livePhoto
    ///
    /// - Parameters:
    ///   - asset: 资源 asset
    ///   - size: 大小
    ///   - mode: 模式
    ///   - progresshandler: 进度回调block
    ///   - completion: 结果回调
    @available(iOS 9.1, *)
    public static func requestLivePhoto(for asset:PHAsset, size : CGSize,resize mode: PHImageContentMode ,_ progresshandler: PHAssetImageProgressHandler?,completion:@escaping (_ livePhoto:  PHLivePhoto?, _ dic : [AnyHashable:Any]?) -> Void) {
        
        let reqeustId:PHImageRequestID = -1
        let width = min(UIScreen.main.bounds.width, 500)
        let scale = UIScreen.main.scale
        if reqeustId >= 1 && size.width/width == scale {
            PHCachingImageManager.default().cancelImageRequest(reqeustId)
        }
        
        let options = PHLivePhotoRequestOptions()
        options.isNetworkAccessAllowed = true
        options.version = .current
        options.deliveryMode = .highQualityFormat
        options.progressHandler = progresshandler
        
        PHCachingImageManager.default().requestLivePhoto(for: asset, targetSize: size, contentMode: mode, options: options) { (livePhoto, dic) in
            if dic != nil {
                let canceled = dic![PHImageCancelledKey] as? Bool ?? false
                let error = dic![PHImageErrorKey] as? Bool ?? false

                if (!canceled && !error) {
                    completion(livePhoto, dic)
                }
            }
        }
    }
    
    
}





















