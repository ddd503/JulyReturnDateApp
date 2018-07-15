//
//  TeamAViewController.swift
//  JulyReturnDateApp
//
//  Created by kawaharadai on 2018/07/15.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import UIKit

class TeamAViewController: UITableViewController {

    // MARK: - Propties
    static var identifier: String {
        return String(describing: self)
    }
    
    // メンバー情報
    var memberNameList = [Member]()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.title = "TeamA"
    }

}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension TeamAViewController {
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return memberNameList.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamACell",
                                                 for: indexPath)
        cell.textLabel?.text = memberNameList[indexPath.row].name
        return cell
    }
    
}
