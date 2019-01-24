//
//  UITableViewCell+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/9.
//

import Foundation

extension NamespaceCompatible where CompatibleType == UITableViewCell {
    
    
    
   /// 获取一个 identifier 根据当前类名
   ///
   /// - Returns: identifier
    static func identifier()  -> String {
        return String(describing: self.tk.classForCoder)
    }
    
    /// dequeue cell for tableView
    ///
    /// - Parameters:
    ///   - tableView: tableView
    ///   - reuseIdentifier: reuseIdentifier
    /// - Returns: UITableViewCell
    public static func dequeueReusableCell<T:UITableViewCell>(tableView: UITableView, reuseIdentifier: String? = "") -> T {
        var id = reuseIdentifier
        if id?.isEmpty ?? true {
            id = String(describing: self.tk.classForCoder())
        }
        var cell = tableView.dequeueReusableCell(withIdentifier: id!)
        if cell == nil  {
            cell = T(style: .default, reuseIdentifier: id)
        }
        return cell as! T
    }
}
