//
//  MenuItemsPlistReaderTests.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import XCTest

class MenuItemsPlistReaderTests: XCTestCase {
    
    func testCorrectErrorDomainIsReturnedWhenPlistDoesNotExist() {
        let plistReader = MenuItemsPlistReader()
        plistReader.plistToReadFrom = "notFound"
        
        let (metadata, error) = plistReader.readMenuItems()
        let errorDomain = error?.domain
        
        XCTAssertEqual(errorDomain!, MenuItemsPlistReaderErrorDomain, "Correct error domain is returned")
    }
    
    func testFaileNotFoundErrorCodeIsReturnedWhenPlistDoesNotExist() {
        let plistReader = MenuItemsPlistReader()
        plistReader.plistToReadFrom = "notFound"
        
        let (metadata, error) = plistReader.readMenuItems()
        let errorCode = error?.code
        XCTAssertEqual(errorCode!, MenuItemsPlistReaderErrorCode.FileNotFound.rawValue, "Correct error code is returned")
    }
    
    func testCorrectErrorDescriptionIsReturnedWhenPlistDoesNotExist() {
        let plistReader = MenuItemsPlistReader()
        plistReader.plistToReadFrom = "notFound"
        
        let (metadata, error) = plistReader.readMenuItems()
        let userInfo = error?.userInfo
        let description: String = userInfo![NSLocalizedDescriptionKey]! as String

        XCTAssertEqual(description, "notFound.plist file doesn't exist in app bundle", "Correct error description is returned")
    }
    
}