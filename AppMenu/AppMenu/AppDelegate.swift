//
//  AppDelegate.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/1/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navController: UINavigationController?
    var appMenuManager: AppMenuManager?
    
    func application(application: UIApplication!,
        didFinishLaunchingWithOptions launchOptions: NSDictionary!)
        -> Bool
    {
        if window == nil {
            window = UIWindow(frame: UIScreen.mainScreen().bounds)
        }
        
        let menuItemsPlistReader = MenuItemsPlistReader()
        menuItemsPlistReader.plistToReadFrom = "menuItems"
        
        if appMenuManager == nil {
            appMenuManager = AppMenuManager()
        }

        appMenuManager!.menuItemsReader = menuItemsPlistReader
        appMenuManager!.menuItemBuilder = MenuItemDefaultBuilder()

        if let menuViewController = appMenuManager!.menuViewController() {
            if navController == nil {
                navController = UINavigationController()
            }

            navController?.viewControllers = [menuViewController]
            window!.rootViewController = navController!
        }

        window!.makeKeyAndVisible()
        return true
    }
}
