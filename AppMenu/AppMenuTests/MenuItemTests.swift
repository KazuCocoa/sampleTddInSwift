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
    func testThatMenuItemHasATitle() {
        let menuItem = MenuItem(title: "Contributions")
        XCTAssertEqual(menuItem.title, "Contributions", "A title should always be present")
    }
    
    func testThatMenuItemCanBeAssignedASubTitle() {
        let menuItem = MenuItem(title: "Contributions")
        menuItem.subTitle = "Repos contributed to"
        
        XCTAssertEqual(menuItem.subTitle!, "Repos contributed to", "Subtitle should be what we assigned")
    }
    
    func testThatMenuItemCanBeAssignedAnIconName() {
        let menuItem = MenuItem(title: "Contributions")
        menuItem.iconName = "iconContributions"
        
        XCTAssertEqual(menuItem.iconName!, "iconContributions", "Icon name should be what we assigned")
    }
}
