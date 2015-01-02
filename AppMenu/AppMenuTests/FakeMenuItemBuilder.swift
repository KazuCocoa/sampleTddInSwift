//
//  FakeMenuItemBuilder.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/3/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import Foundation

class FakeMenuItemBuilder : MenuItemBuilder {
    var errorToReturn: NSError? = nil
    var menuItemsToReturn: [MenuItem]? = nil
    var metadata: [[String : String]]? = nil
    
    func buildMenuItemsFromMetadata(metadata: [[String : String]])
        -> ([MenuItem]?, NSError?)
    {
        self.metadata = metadata
        return (menuItemsToReturn, errorToReturn)
    }
}