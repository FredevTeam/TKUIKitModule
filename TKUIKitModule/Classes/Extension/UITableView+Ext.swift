//
//  UITableView+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/11/9.
//

import Foundation
import UIKit

/// Cell
public protocol Reusable: class  {
    static var reuseIdentifier: String {get}
    static var nib: UINib? {get}
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    static var nib: UINib? {return nil }
}


// MARK: - UITbaleView Create
extension TypeWrapperProtocol where WrappedType : UITableView {
    
    /// create tableView
    ///
    /// - Parameter type: type
    /// - Returns: UITableView
    public static func create(with type : UITableView.Style, delegate: UITableViewDelegate?, dataSource: UITableViewDataSource?) -> UITableView{
        let tableView = UITableView(frame: CGRect.zero, style: type)
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 55
        tableView.backgroundColor = UIColor.white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView()
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
            
        } else {
            // Fallback on earlier versions
        }
        return tableView
    }
    
}

// MARK: - UITableView Cell manager
extension TypeWrapperProtocol where WrappedType : UITableView {
    /// register cell
    ///
    /// - Parameter _:
    public func registerReusableCell<T: UITableViewCell>(_ : T.Type) where T:Reusable {
        if let nib = T.nib {
            self.wrappedValue.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            self.wrappedValue.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    /// register header footer View with Reusable protocol
    ///
    /// - Parameter _: UITableViewHeaderFooterView
    public func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            self.wrappedValue.register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        } else {
            self.wrappedValue.register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    /// dequeue reusable cell with Reusable protocol
    ///
    /// - Parameter indexPath: indexPath
    /// - Returns: UITableViewCell
    public func dequeueReusableCell<T: UITableViewCell>(indexPath: NSIndexPath) -> T where T: Reusable {
        return self.wrappedValue.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }

    
    /// dequeue footer view
    ///
    /// - Returns: UITableViewHeaderFooterView
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? where T: Reusable {
        return self.wrappedValue.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T?
    }
    
    
    /// dequeue Reusable cell , but need frist register cell(此方法需要先注册cell)
    ///
    /// - Parameter name: UITableViewCell name
    /// - Returns: UITableViewCell
    public func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type) -> T {
        guard let cell = self.wrappedValue.dequeueReusableCell(withIdentifier:  String(describing: name))as? T else {
            fatalError("Couldn't find UITableViewCell for \(String(describing: name))")
        }
        return cell
    }
    
    
    /// dequeue Reusable cell with indexPath, but need frist register cell(此方法需要先注册cell)
    ///
    /// - Parameters:
    ///   - name: name
    ///   - indexPath: indexPath
    /// - Returns: UITableViewCell
    public func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.wrappedValue.dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError("Couldn't find UITableViewCell for \(String(describing: name))")
        }
        return cell
    }


}




// MARK: - UITableView Other
extension TypeWrapperProtocol where WrappedType : UITableView {

    /// reload data with  animation (动画刷新数据 )
    ///
    /// - Parameters:
    ///   - duration: duration
    ///   - completion: completion
    public func reloadData(duration: TimeInterval,_ completion: (() -> Void)?) {
        UIView.animate(withDuration: duration, animations: {
            self.wrappedValue.reloadData()
        }) { (result) in
            completion?()
        }
    }

    /// scroll to bottom
    ///
    /// - Parameter animated: animated default true
    public func scrollToBottom(animated: Bool = true){
        self.wrappedValue.setContentOffset(CGPoint(x: 0, y: self.wrappedValue.contentSize.height - self.wrappedValue.bounds.size.height), animated: animated)
    }

    /// scroll to top
    ///
    /// - Parameter animated: animated default true
    public func scrollToTop(animated: Bool = true){
        self.wrappedValue.setContentOffset(CGPoint.zero, animated: animated)
    }



}
