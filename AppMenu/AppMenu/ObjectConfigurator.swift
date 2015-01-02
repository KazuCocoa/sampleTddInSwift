//
//  ObjectConfigurator.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/3/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import UIKit

class ObjectConfigurator {
    func appMenuManager() -> AppMenuManager {
        let appMenuManager = AppMenuManager()
        let menuItemsPlistReader = MenuItemsPlistReader()
        
        menuItemsPlistReader.plistToReadFrom = "menuItems"
        appMenuManager.menuItemsReader = menuItemsPlistReader
        appMenuManager.menuItemBuilder = MenuItemDefaultBuilder()
        appMenuManager.objectConfigurator = self
        return appMenuManager
    }
    
    func menuViewController() -> MenuViewController {
        let menuViewController
        = MenuViewController(nibName: "MenuViewController",
            bundle: nil)
        
        menuViewController.dataSource = MenuTableDefaultDataSource()
        menuViewController.tapHandlerBuilder = MenuItemTapHandlerBuilder()
        
        return menuViewController
    }
}
