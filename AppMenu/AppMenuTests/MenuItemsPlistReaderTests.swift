//
//  MenuItemsPlistReaderTests.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import XCTest

class MenuItemsPlistReaderTests: XCTestCase {
    var plistReader: MenuItemsPlistReader?
    var metadata: [[String : String]]?
    var error: NSError?
    
    override func setUp() {
        super.setUp()
        plistReader = MenuItemsPlistReader()
        plistReader?.plistToReadFrom = "notFound"
        (metadata, error) = plistReader!.readMenuItems()
    }
    
    func testCorrectErrorDomainIsReturnedWhenPlistDoesNotExist() {
        let errorDomain = error?.domain
        XCTAssertEqual(errorDomain!, MenuItemsPlistReaderErrorDomain, "Correct error domain is returned")
    }
    
    func testFaileNotFoundErrorCodeIsReturnedWhenPlistDoesNotExist() {
        let errorCode = error?.code
        XCTAssertEqual(errorCode!, MenuItemsPlistReaderErrorCode.FileNotFound.rawValue, "Correct error code is returned")
    }
    
    func testCorrectErrorDescriptionIsReturnedWhenPlistDoesNotExist() {
        let userInfo = error?.userInfo
        let description: String = userInfo![NSLocalizedDescriptionKey]! as String
        
        XCTAssertEqual(description, "notFound.plist file doesn't exist in app bundle", "Correct error description is returned")
    }
    
    func testPlistIsDeserializedCorrectly() {
        let plistReader = MenuItemsPlistReader()
        plistReader.plistToReadFrom = "menuItems"
        
        let (metadata, error) = plistReader.readMenuItems()
        XCTAssertTrue(metadata?.count == 3, "There should only be three dictionaries in plist")
        
        let firstRow = metadata?[0]
        XCTAssertEqual(firstRow!["title"]!, "Contributions", "First row's title should be what's in plist")
        XCTAssertEqual(firstRow!["subTitle"]!, "Repos contributed to", "First row's subtitle should be what's in plist")
        XCTAssertEqual(firstRow!["iconName"]!, "iconContributions", "First row's icon name should be what's in plist")
        XCTAssertEqual(firstRow!["tapHandlerName"]!,
            "ContributionsViewController",
            "1st row's tap handler should be what's in plist")
        
        let secondRow = metadata?[1]
        XCTAssertEqual(secondRow!["title"]!, "Repositories", "Second row's title should be what's in plist")
        XCTAssertEqual(secondRow!["subTitle"]!, "Repos collaborating", "Second row's subtitle should be what's in plist")
        XCTAssertEqual(secondRow!["iconName"]!, "iconRepositories", "Second row's icon name should be what's in plist")
        XCTAssertEqual(secondRow!["tapHandlerName"]!,
            "RepositoriesViewController",
            "2nd row's tap handler should be what's in plist")
        
        let thirdRow = metadata?[2]
        XCTAssertEqual(thirdRow!["title"]!, "Public Activity", "Third row's title should be what's in plist")
        XCTAssertEqual(thirdRow!["subTitle"]!, "Activity viewable by anyone", "Third row's subtitle should be what's in plist")
        XCTAssertEqual(thirdRow!["iconName"]!, "iconPublicActivity", "Third row's icon name should be what's in plist")
        XCTAssertEqual(thirdRow!["tapHandlerName"]!,
            "PublicActivityViewController",
            "3rd row's tap handler should be what's in plist")
        
    }
    
}