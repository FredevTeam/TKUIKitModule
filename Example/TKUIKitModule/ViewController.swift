//
//  ViewController.swift
//  TKUIKitModule
//
//  Created by zhuamaodeyu on 01/24/2019.
//  Copyright (c) 2019 zhuamaodeyu. All rights reserved.
//

import UIKit
import TKUIKitModule

class ViewController: UIViewController {

    private var dataSource: [String:String] = [:]
    private var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView.init(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        test()
    }
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.keys.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "dequeueReusableCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellId)
        }
        cell?.textLabel?.text = Array(dataSource.keys)[indexPath.row]
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            
            let value = dataSource[Array(dataSource.keys)[indexPath.row]] ?? ""
            
            
            //在 swift 下类名前面需要添加 bundle 名称
            let classStringName: String = appName + "." + value
            
            if let toClass: UIViewController.Type = NSClassFromString(classStringName) as? UIViewController.Type {
                let toController: UIViewController = toClass.init()
                self.navigationController?.pushViewController(toController, animated: true)
            }
        }
    }
}


extension ViewController {
    private func test() {
        dataSource.updateValue("UIViewViewController", forKey: "UIView")
        dataSource.updateValue("UITextViewViewController", forKey: "UITextView")
        dataSource.updateValue("UITextFieldViewController", forKey: "UITextField")
        dataSource.updateValue("UITableViewViewController", forKey: "UITableView + UITableViewCell")
        dataSource.updateValue("UIScrollViewViewController", forKey: "UIScrollView")
        dataSource.updateValue("UINavigationBarViewController", forKey: "UINavigationBar")
        dataSource.updateValue("UILabelViewController", forKey: "UILabel")
        dataSource.updateValue("UIImageViewViewController", forKey: "UIImageView")
        dataSource.updateValue("UIButtonViewController", forKey: "UIButton")
    }
}
