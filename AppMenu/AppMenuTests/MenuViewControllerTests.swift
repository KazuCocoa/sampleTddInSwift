//
//  MenuViewControllerTests.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import UIKit
import XCTest

let postedNotification = "MenuViewControllerTestsPostedNotification"

class MenuViewControllerTests: XCTestCase {
    var menuViewController: MenuViewController?
    var dataSource: MenuTableDataSource?
    var tableView: UITableView?
    
    override func setUp() {
        super.setUp()
        dataSource = MenuTableFakeDataSource()
        tableView = UITableView()
        
        menuViewController = MenuViewController()
        menuViewController?.dataSource = dataSource
        //menuViewController?.tableViwe = tableView
    }
    
    override func tearDown() {
        super.tearDown()
        objc_removeAssociatedObjects(menuViewController)
    }
    
    
    func testHasATitle() {
        menuViewController?.viewDidLoad()
        XCTAssertEqual(menuViewController!.title!, "App Menu", "Menu view should show a proper title")
    }
    
    func testCanBeAssignedADataSource() {
        XCTAssertTrue(dataSource!.isEqual(menuViewController?.dataSource), "A data source can be assigned to a menu view controller")
    }
    
    func testHasATableView() {
        XCTAssertTrue(tableView!.isEqual(menuViewController?.tableView), "Menu view controller has a table view")
    }
    
    func testTableViewIsGivenADataSourceInViewDidLoad() {
        menuViewController?.viewDidLoad()
        //XCTAssertTrue(tableView!.dataSource.isEqual(dataSource),
        //    "Data source for the menu table view is set in viewDidLoad method")
    }
    
    func testTableViewIsGivenADelegateInViewDidLoad() {
        menuViewController?.viewDidLoad()
        //XCTAssertTrue(tableView!.delegate.isEqual(dataSource),
        //    "Delegate for the menu table view is set in viewDidLoad method")
    }
    
    func testRegistrationForNotificationHappensInViewDidAppear() {
        swizzleNotificationHandler()
        menuViewController?.viewDidAppear(false)
        
        let notification =
        NSNotification(
            name: MenuTableDataSourceDidSelectItemNotification,
            object: nil)
        
        NSNotificationCenter.defaultCenter().postNotification(notification)
        
        XCTAssertNotNil(
            objc_getAssociatedObject(menuViewController, postedNotification),
            "Listens to notification only when it's view is visible")
    }
    
    func testRemovesItselfAsListenerForNotificationInViewDidDisappear() {
        swizzleNotificationHandler()
        menuViewController?.viewDidAppear(false)
        menuViewController?.viewDidDisappear(false)
        
        let notification =
        NSNotification(
            name: MenuTableDataSourceDidSelectItemNotification,
            object: nil)
        
        NSNotificationCenter.defaultCenter().postNotification(notification)
        
        XCTAssertNil(
            objc_getAssociatedObject(menuViewController, postedNotification),
            "Stops listening for notfication when view is not visible anymore")
    }
    
    // Mark: - Method swizzling
    
    func swizzleNotificationHandler() {
        var realMethod: Method =
        class_getInstanceMethod(
            object_getClass(menuViewController),
            "didSelectMenuItemNotification:")
        
        var testMethod: Method =
        class_getInstanceMethod(
            object_getClass(menuViewController),
            "testImpl_didSelectMenuItemNotification:")
        
        method_exchangeImplementations(realMethod, testMethod)
    }
}

extension MenuViewController {
    func testImpl_didSelectMenuItemNotification(
        notification: NSNotification)
    {
        objc_setAssociatedObject(self,
            postedNotification,
            notification,
            UInt(OBJC_ASSOCIATION_RETAIN))
    }
    
}
