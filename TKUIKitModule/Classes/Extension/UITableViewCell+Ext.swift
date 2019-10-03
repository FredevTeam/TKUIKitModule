//
//  UITableViewCell+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/9.
//

import Foundation


fileprivate var kindexPath = "kindexPath"
extension UITableViewCell {
    var indexPath:IndexPath?
    {
        get {
            return (objc_getAssociatedObject(self, &kindexPath) as? IndexPath)
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kindexPath, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}


// MARK: - UITableViewCell 
extension TypeWrapperProtocol where WrappedType == UITableViewCell {
    
    
    
   /// 获取一个 identifier 根据当前类名
   ///
   /// - Returns: identifier
   public static func identifier()  -> String {
        return String(describing: self.WrappedType.classForCoder)
    }
    
    /// dequeue cell for tableView
    ///
    /// - Parameters:
    ///   - tableView: tableView
    ///   - indexPath: indexPath
    ///   - reuseIdentifier: reuseIdentifier
    /// - Returns: UITableViewCell
    public static func dequeueReusableCell<T:UITableViewCell>(tableView: UITableView,indexPath: IndexPath?, reuseIdentifier: String = "") -> T {
        var id = reuseIdentifier
        if id.isEmpty {
            id = String(describing: self.WrappedType.classForCoder())
        }
        var cell = tableView.dequeueReusableCell(withIdentifier: id)
        if cell == nil  {
            cell = T(style: .default, reuseIdentifier: id)
        }
        cell?.indexPath = indexPath
        return cell as! T
    }
}
