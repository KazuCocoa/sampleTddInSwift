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
    
    func testMenuItemPropertiesContainValuesPresentInDictionary() {
        fakeMenuItemsReader!.missingTitle = false
        let (metadata, _) = fakeMenuItemsReader!.readMenuItems()
        
        (menuItems, _) =
            menuItemBuilder!.buildMenuItemsFromMetadata(metadata!)
        
        let rawDictionary1 = metadata![0]
        let menuItem1 = menuItems![0]
        
        XCTAssertEqual(menuItem1.title,
            rawDictionary1["title"]!,
            "1st menu item's title should be what's in the 1st dictionary")
        
        XCTAssertEqual(menuItem1.subTitle!,
            rawDictionary1["subTitle"]!,
            "1st menu item's subTitle should be what's in the 1st dictionary")
        
        XCTAssertEqual(menuItem1.iconName!,
            rawDictionary1["iconName"]!,
            "1st menu item's icon name should be what's in the 1st dictionary")
        
        XCTAssertEqual(menuItem1.tapHandlerName!,
            rawDictionary1["tapHandlerName"]!,
            "1st menu item's tap handler should be what's in the 1st dict")
        
        let rawDictionary2 = metadata![1]
        let menuItem2 = menuItems![1]

        
        XCTAssertEqual(menuItem2.title,
            rawDictionary2["title"]!,
            "2nd menu item's title should be what's in the 2nd dictionary")
        
        XCTAssertEqual(menuItem2.subTitle!,
            rawDictionary2["subTitle"]!,
            "2nd menu item's subTitle should be what's in the 2nd dictionary")
        
        XCTAssertEqual(menuItem2.iconName!, 
            rawDictionary2["iconName"]!,
            "2nd menu item's icon name should be what's in the 2nd dictionary")
        
        XCTAssertEqual(menuItem2.tapHandlerName!,
            rawDictionary2["tapHandlerName"]!,
            "2nd menu item's tap handler should be what's in the 2nd dict")
    }
}
