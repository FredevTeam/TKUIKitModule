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

    private var dataSource: [String] = []
    private var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView.init(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
}

extension ViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "dequeueReusableCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellId)
        }
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
