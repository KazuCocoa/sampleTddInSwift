//
//  MenuItemsPlistReader.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import Foundation

class MenuItemsPlistReader: MenuItemsReader {
    var plistToReadFrom: String? = nil
    
    func readMenuItems() -> ([[String : String]]?, NSError?) {
        let error = NSError(domain: "Some domain", code: 0, userInfo: nil)
        return ([], error)
    }
}