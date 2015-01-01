//
//  MenuItemsReader.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import Foundation

protocol MenuItemsReader {
    func readMenuItems() -> ([[String : String]]?, NSError?)
}
