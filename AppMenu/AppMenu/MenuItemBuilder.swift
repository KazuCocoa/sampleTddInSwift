//
//  MenuItemBuilder.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import Foundation

let MenuItemBuilderErrorDomain = "MenuItemBuilderErrorDomain"

enum MenuItemBuilderErrorCode : Int {
    case MissingTitle
}

class MenuItemBuilder {
    func buildMenuItemsFromMetadata(metadata: [[String : String]])
        -> ([MenuItem]?, NSError?)
    {
        let userInfo =
        [NSLocalizedDescriptionKey: "All menu items must have a title"]
        
        let error = NSError(domain: MenuItemBuilderErrorDomain,
            code: MenuItemBuilderErrorCode.MissingTitle.rawValue,
            userInfo: userInfo)
        
        return ([], error)
    }
}