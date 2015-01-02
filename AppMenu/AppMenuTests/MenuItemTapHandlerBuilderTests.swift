//
//  MenuItemTapHandlerBuilderTests.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/3/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import UIKit
import XCTest

class MenuItemTapHandlerBuilderTests: XCTestCase {
    var tapHandlerBuilder: MenuItemTapHandlerBuilder?
    var menuItem: MenuItem?
    
    override func setUp() {
        super.setUp()
        tapHandlerBuilder = MenuItemTapHandlerBuilder()
        menuItem = MenuItem(title: "Test menu item")
    }
    
    func testReturnsContributionsVCForContributionsMenuItem() {
        menuItem?.tapHandlerName = "ContributionsViewController"
        let tapHandler = tapHandlerBuilder?.tapHandlerForMenuItem(menuItem)
        
        XCTAssertTrue(tapHandler is ContributionsViewController,
            "Contributions VC should handle contributions menu item tap")
    }
    
    func testReturnsRepositoriesVCForRepositoriesMenuItem() {
        menuItem?.tapHandlerName = "RepositoriesViewController"
        let tapHandler = tapHandlerBuilder?.tapHandlerForMenuItem(menuItem)
        
        XCTAssertTrue(tapHandler is RepositoriesViewController,
            "Repositories VC should handle repositories menu item tap")
    }
    
    func testReturnsPublicActivityVCForPublicActivityMenuItem() {
        menuItem?.tapHandlerName = "PublicActivityViewController"
        let tapHandler = tapHandlerBuilder?.tapHandlerForMenuItem(menuItem)
        
        XCTAssertTrue(tapHandler is PublicActivityViewController,
            "PublicActivity VC should handle public activity menu item tap")
    }
    
    func testReturnsNilForAnyOtherMenuItem() {
        menuItem?.tapHandlerName = "UnknownViewController"
        let tapHandler = tapHandlerBuilder?.tapHandlerForMenuItem(menuItem)
        
        XCTAssertNil(tapHandler,
            "Tap handler is not built for an unkown menu item")
    }
}