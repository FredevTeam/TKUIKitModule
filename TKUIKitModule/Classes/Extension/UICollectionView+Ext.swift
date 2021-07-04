//
//  UICollectionView+Ext.swift
//  Pods-TKUIKitModule_Example
//
//  Created by 聂子 on 2018/12/8.
//

import Foundation


// MARK: - UICollection View Create
extension TypeWrapperProtocol where WrappedType : UICollectionView {
    
    /// create UICollectionView
    ///
    /// - Parameters:
    ///   - collectionViewLayout: collectionViewLayout
    ///   - delegate: delegate
    ///   - dataSource: dataSource
    /// - Returns: UICollectionView
    public static func create(with collectionViewLayout:UICollectionViewLayout?, delegate:UICollectionViewDelegate?, dataSource: UICollectionViewDataSource?) -> UICollectionView{
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout ?? UICollectionViewFlowLayout())
        collectionView.delegate = delegate
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = dataSource
        collectionView.backgroundColor = UIColor.clear
        return collectionView
    }
    
    
    /// create UICollectionView
    ///
    /// - Parameter collectionViewLayout: collectionViewLayout
    /// - Returns: UICollectionView
    public static func create(with collectionViewLayout: UICollectionViewLayout) -> UICollectionView {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout )
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.clear
        return collectionView
    }
    

}

// MARK: - UICollection View Other 
extension TypeWrapperProtocol where WrappedType : UICollectionView {


    /// reload data with animation
    ///
    /// - Parameters:
    ///   - duration: animation duration
    ///   - completion: completion
    public func reloadData(duration: TimeInterval,_ completion: (() -> Void)?) {
        UIView.animate(withDuration: duration, animations: {
            self.wrappedValue.performBatchUpdates({
                self.wrappedValue.reloadData()
            }) { (result) in
                completion?()
            }
        }) { (result) in
            completion?()
        }
    }

}

// MARK: - UICollection View Cell manager
extension TypeWrapperProtocol where WrappedType : UICollectionView {

    /// register cell
    ///
    /// - Parameter _: UICollectionViewCell subView
    public func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            self.wrappedValue.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        } else {
            self.wrappedValue.register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }


    /// register cell
    ///
    /// - Parameter _: UICollectionViewCell subView
    public func registerReusableCell<T:UICollectionViewCell>(_:T) {
        self.wrappedValue.register(T.classForCoder(), forCellWithReuseIdentifier: String(describing: T.classForCoder()))
    }


    /// dequeue cell
    ///
    /// - Parameter indexPath: indexPath
    /// - Returns: UICollectionViewCell
    public func dequeueReusableCell<T: UICollectionViewCell>(indexPath: NSIndexPath) -> T where T: Reusable {
        return self.wrappedValue.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }

    public func registerReusableSupplementaryView<T: Reusable>(elementKind: String, _: T.Type) {
        if let nib = T.nib {
            self.wrappedValue.register(nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
        } else {
            self.wrappedValue.register(T.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
        }
    }

    public func dequeueReusableSupplementaryView<T: UICollectionViewCell>(elementKind: String, indexPath: NSIndexPath) -> T where T: Reusable {
        return self.wrappedValue.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }


}
