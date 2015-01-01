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
}
