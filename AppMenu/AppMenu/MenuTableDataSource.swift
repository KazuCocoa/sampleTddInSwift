//
//  MenuTableDataSource.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import UIKit

let MenuTableDataSourceDidSelectItemNotification = "MenuTableDataSourceDidSelectItemNotification"

protocol MenuTableDataSource : UITableViewDataSource {
    func setMenuItems(menuItems: [MenuItem])
}
