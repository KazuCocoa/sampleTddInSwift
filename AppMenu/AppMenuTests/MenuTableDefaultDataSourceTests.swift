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
    var dataSource: MenuTableDefaultDataSource?
    var testMenuItem: MenuItem?
    var menuItemsList: [MenuItem]?
    var postedNotification: NSNotification?
    var selectedIndexPath: NSIndexPath?
    
    override func setUp() {
        super.setUp()
        
        testMenuItem = MenuItem(title: "Test menu item")
        menuItemsList = [testMenuItem!]
        selectedIndexPath = NSIndexPath(forRow: 0, inSection: 0)

        dataSource = MenuTableDefaultDataSource()
        dataSource!.setMenuItems(menuItemsList!)
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self,
            selector: "didReceiveNotification:",
            name: MenuTableDataSourceDidSelectItemNotification,
            object: nil)
    }
    
    override func tearDown() {
        super.tearDown()
        postedNotification = nil
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    

    func didReciveNotification(notification: NSNotification) {
        postedNotification = notification
    }
    
    func testANotificationIsPostedWhenACellIsTapped() {
        let tableview = UITableView()
        dataSource!.tableView(tableview, cellForRowAtIndexPath:selectedIndexPath!)
        //dataSource!.tableView(tableview, didSelectRowAtIndexPath:selectedIndexPath!)
        
        //TODO: should modify
        //XCTAssertEqual(postedNotification!.name,
        //  MenuTableDataSourceDidSelectItemNotification,
        //"Data source posts a notification when a cell is tapped")
    }
    
    func testPostedNotificationContainsMenuItemInfo() {
        let tableview = UITableView()
        dataSource!.tableView(tableview, cellForRowAtIndexPath:selectedIndexPath!)
        //dataSource!.tableView(tableview, didSelectRowAtIndexPath:selectedIndexPath!)
        
        //TODO: equalable
        //XCTAssertEqual(testMenuItem!, postedNotification!.object?, "Notification contains menu item object")
    }
    
    
    func testReturnsOneRowForOneMenuItem() {
        let tableview = UITableView()
        let numberOfRows = dataSource!.tableView(tableview, numberOfRowsInSection:0)
        
        XCTAssertEqual(numberOfRows, menuItemsList!.count, "Only 1 row is returned since we're passing 1 menu item")
    }
    
    func testReturnsTwoRowsForTwoMenuItems() {
        let testMenuItem1 = MenuItem(title: "Test menu item 1")
        let testMenuItem2 = MenuItem(title: "Test menu item 2")
        let menuItemsList = [testMenuItem1, testMenuItem2]
        
        dataSource!.setMenuItems(menuItemsList)
        
        let tableview = UITableView()
        let numberOfRows = dataSource!.tableView(tableview, numberOfRowsInSection:0)
        
        XCTAssertEqual(numberOfRows, menuItemsList.count, "Returns two rows as we're passing two menu items")
    }
    
    func testReturnsOnlyOneSection() {
        let numberOfSections = dataSource!.numberOfSectionsInTableView(nil)
        XCTAssertEqual(numberOfSections, 1,
            "There should only be one section")
    }
    
    func testEachCellContainsTitleForRespectiveMenuItem() {
        let firstMenuItem = NSIndexPath(forRow: 0, inSection: 0)
        let tableview = UITableView()

        let cell = dataSource!.tableView(tableview, cellForRowAtIndexPath: firstMenuItem)
        
        XCTAssertEqual(cell.textLabel!.text!, "Test menu item", "A cell contains the title of a menu item it's representing")
        
    }
}
