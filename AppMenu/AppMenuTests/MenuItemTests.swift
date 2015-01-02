//
//  MenuItemTests.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import UIKit
import XCTest

class MenuItemTests: XCTestCase {
    var menuItem: MenuItem?
    
    override func setUp() {
        super.setUp()
        menuItem = MenuItem(title: "Contributions")
    }
    
    override func tearDown() {
        super.tearDown()
        // do something
    }
    
    func testThatMenuItemHasATitle() {
        XCTAssertEqual(menuItem!.title, "Contributions", "A title should always be present")
    }
    
    func testThatMenuItemCanBeAssignedASubTitle() {
        menuItem!.subTitle = "Repos contributed to"
        
        XCTAssertEqual(menuItem!.subTitle!, "Repos contributed to", "Subtitle should be what we assigned")
    }
    
    func testThatMenuItemCanBeAssignedAnIconName() {
        menuItem!.iconName = "iconContributions"
        
        XCTAssertEqual(menuItem!.iconName!, "iconContributions", "Icon name should be what we assigned")
    }
    
    func testThatMenuItemCanBeAssignedATapHandlerName() {
        menuItem!.tapHandlerName = "someViewController"
        XCTAssertEqual(menuItem!.tapHandlerName!,
            "someViewController",
            "Tap handler name should be what we assigned")
    }
}
