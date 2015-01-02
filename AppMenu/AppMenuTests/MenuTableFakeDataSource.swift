//
//  MenuTableFakeDataSource.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import Foundation
import UIKit

class MenuTableFakeDataSource : NSObject, MenuTableDataSource {
    func setMenuItems(menuItems: [MenuItem]) {
    }
    
    // MARK: - UITableView data source methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: nil)

        return cell
    }
}