//
//  MenuTableDefaultDataSourceTests.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import UIKit
import XCTest

class MenuTableDefaultDataSourceTests: XCTestCase {
    func testReturnsOneRowForOneMenuItem() {
        let testMenuItem = MenuItem(title: "Test menu item")
        let menuItemsList = [testMenuItem]
        
        let dataSource = MenuTableDefaultDataSource()
        dataSource.setMenuItems(menuItemsList)
        
        let numberOfRows = dataSource.tableView(nil, numberOfRowsInSection:0)
        
        XCTAssertEqual(numberOfRows, menuItemsList.count, "Only 1 row is returned since we're passing 1 menu item")
    }
}
