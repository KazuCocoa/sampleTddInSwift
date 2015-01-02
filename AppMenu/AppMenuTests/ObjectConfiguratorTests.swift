//
//  ObjectConfiguratorTests.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/3/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import UIKit
import XCTest

class ObjectConfiguratorTests: XCTestCase {
    var objectConfigurator: ObjectConfigurator?
    
    override func setUp() {
        super.setUp()
        objectConfigurator = ObjectConfigurator()
    }
    
    func testConfiguresAppMenuManagerCorrectly() {
        let appMenuManager = objectConfigurator?.appMenuManager()
        XCTAssertNotNil(appMenuManager, "App menu manager is not nil")
        
        XCTAssertTrue(appMenuManager?.menuItemsReader != nil,
            "App menu manager has a menu items reader")
        XCTAssertTrue(appMenuManager?.menuItemBuilder != nil,
            "App menu manager has a menu item builder")
        XCTAssertNotNil(appMenuManager?.objectConfigurator,
            "App menu manager has an object configurator")
    }
    
    func testConfiguresMenuViewControllerCorrectly() {
        let menuViewController = objectConfigurator?.menuViewController()
        
        XCTAssertNotNil(menuViewController,
            "Menu view controller is not nil")
        
        XCTAssertNotNil(menuViewController?.dataSource,
            "Menu view controller has a data source")
        
        XCTAssertNotNil(menuViewController?.tapHandlerBuilder,
            "Menu view controller has a tap handler builder")
    }
}