//
//  MenuItemsPlistReaderTests.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import XCTest

class MenuItemsPlistReaderTests: XCTestCase {
    func testErrorIsReturnedWhenPlistFileDoesNotExist() {
        let plistReader = MenuItemsPlistReader()
        plistReader.plistToReadFrom = "notFound"
    
        let (metadata, error) = plistReader.readMenuItems()
        XCTAssertNotNil(error, "Error is returned when plist doesn't exist")
    }
}