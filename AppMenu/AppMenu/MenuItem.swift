//
//  MenuItem.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import Foundation

class MenuItem {
    let title: String
    var subTitle: String?
    var iconName: String?
    var tapHandlerName: String?
    
    init(title: String) {
        self.title = title
    }
}