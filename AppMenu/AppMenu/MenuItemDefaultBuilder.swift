//
//  MenuItemBuilder.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import Foundation

let MenuItemDefaultBuilderErrorDomain = "MenuItemDefaultBuilderErrorDomain"

enum MenuItemDefaultBuilderErrorCode : Int {
    case MissingTitle
}

class MenuItemDefaultBuilder : MenuItemBuilder {
    func buildMenuItemsFromMetadata(metadata: [[String : String]])
        -> ([MenuItem]?, NSError?)
    {
        var menuItems = [MenuItem]()
        var error: NSError?
        
        for dictionary in metadata {
            if let title = dictionary["title"] {
                let menuItem = MenuItem(title: title)
                menuItem.subTitle = dictionary["subTitle"]
                menuItem.iconName = dictionary["iconName"]
                menuItem.tapHandlerName = dictionary["tapHandlerName"]
                menuItems.append(menuItem)
            }
            else {
                error = missingTitleError()
                menuItems.removeAll(keepCapacity: false)
                break
            }
        }
        
        return (menuItems, error)
    }
    
    private func missingTitleError() -> NSError {
        let userInfo =
        [NSLocalizedDescriptionKey: "All menu items must have a title"]
        
        return NSError(domain: MenuItemDefaultBuilderErrorDomain,
            code: MenuItemDefaultBuilderErrorCode.MissingTitle.rawValue,
            userInfo: userInfo)
    }
}