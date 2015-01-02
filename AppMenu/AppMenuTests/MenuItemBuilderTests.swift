//
//  MenuItemBuilderTests.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import UIKit
import XCTest

class MenuItemBuilderTests: XCTestCase {
    var menuItemBuilder: MenuItemBuilder?
    var fakeMenuItemsReader: FakeMenuItemsReader?
    var menuItems: [MenuItem]?
    var error: NSError?
    
    override func setUp() {
        fakeMenuItemsReader = FakeMenuItemsReader()
        fakeMenuItemsReader!.missingTitle = true
        let (metadata, _) = fakeMenuItemsReader!.readMenuItems()
        
        menuItemBuilder = MenuItemBuilder()
        
        (menuItems, error) =
            menuItemBuilder!.buildMenuItemsFromMetadata(metadata!)
    }
    
    func testCorrectErrorDomainIsReturnedWhenTitleIsMissing() {
        let errorDomain = error?.domain
        XCTAssertEqual(errorDomain!, MenuItemBuilderErrorDomain,
            "Correct error domain is returned")
    }
    
    func testMissingTitleErrorCodeIsReturnedWhenTitleIsMissing() {
        let errorCode = error?.code
        XCTAssertEqual(errorCode!,
            MenuItemBuilderErrorCode.MissingTitle.rawValue,
            "Correct error code is returned")
    }
    
    func testCorrectErrorDescriptionIsReturnedWhenTitleIsMissing() {
        let userInfo = error?.userInfo
        let description: String =
        userInfo![NSLocalizedDescriptionKey]! as String
        
        XCTAssertEqual(description,
            "All menu items must have a title",
            "Correct error description is returned")
    }
    
    func testEmptyArrayIsReturnedWhenErrorIsPresent() {
        XCTAssertTrue(menuItems?.count == 0,
            "No menu item instances are returned when error is present")
    }
}
