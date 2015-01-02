//
//  MenuItemBuilder.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/3/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import Foundation

protocol MenuItemBuilder {
    func buildMenuItemsFromMetadata(metadata: [[String : String]]) -> ([MenuItem]?, NSError?)
}