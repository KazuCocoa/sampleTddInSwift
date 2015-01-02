//
//  MenuItemsPlistReader.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import Foundation

let MenuItemsPlistReaderErrorDomain = "MenuItemsPlistReaderErrorDomain"

enum MenuItemsPlistReaderErrorCode : Int {
    case FileNotFound
}

class MenuItemsPlistReader: MenuItemsReader {
    var plistToReadFrom: String? = nil
    
    func readMenuItems() -> ([[String : String]]?, NSError?) {
        var error: NSError? = nil
        var fileContents: [[String : String]]? = nil
        let bundle = NSBundle(forClass: object_getClass(self))
        
        if let filePath = bundle.pathForResource(plistToReadFrom, ofType: "plist") {
            fileContents = NSArray(contentsOfFile: filePath) as? [[String : String]]
        } else {
            let errorMessage = "\(plistToReadFrom!).plist file doesn't exist in app bundle"
            let userInfo = [NSLocalizedDescriptionKey: errorMessage]
            error = NSError(domain: MenuItemsPlistReaderErrorDomain,
                code: MenuItemsPlistReaderErrorCode.FileNotFound.rawValue,
                userInfo: userInfo)
        }
        
        return (fileContents, error)
    }
}