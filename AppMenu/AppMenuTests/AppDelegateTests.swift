//
//  AppDelegateTests.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/3/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import UIKit
import XCTest

class AppDelegateTests: XCTestCase {
    var window: UIWindow?
    var navController: UINavigationController?
    var appDelegate: AppDelegate?
    var appMenuManager: AppMenuManager?
    var didFinishLaunchingWithOptionsReturnValue: Bool?
    
    override func setUp() {
        super.setUp()
        
        window = UIWindow()
        navController = UINavigationController()
        appMenuManager = AppMenuManager()
        appDelegate = AppDelegate()
        appDelegate?.window = window
        appDelegate?.navController = navController
    }
    
    func testRootVCForWindowIsNotSetIfMenuViewControllerCannotBeCreated() {
        class FakeAppMenuManager: AppMenuManager {
            override func menuViewController() -> MenuViewController? {
                return nil
            }
        }
        
        appDelegate?.appMenuManager = FakeAppMenuManager()
        appDelegate?.application(nil, didFinishLaunchingWithOptions: nil)
        
        XCTAssertNil(window!.rootViewController,
            "Window's root VC shouldn't be set if menu VC can't be created")
    }
    
    func testWindowHasRootViewControllerIfMenuViewControllerIsCreated() {
        class FakeAppMenuManager: AppMenuManager {
            override func menuViewController() -> MenuViewController? {
                return MenuViewController()
            }
        }
        
        appDelegate?.appMenuManager = FakeAppMenuManager()
        appDelegate?.application(nil, didFinishLaunchingWithOptions: nil)
        XCTAssertEqual(window!.rootViewController!, navController!,
            "App delegate's nav controller should be the root view controller")
    }
    
    func testMenuViewControllerIsRootVCForNavigationController() {
        class FakeAppMenuManager: AppMenuManager {
            override func menuViewController() -> MenuViewController? {
                return MenuViewController()
            }
        }
        
        appDelegate?.appMenuManager = FakeAppMenuManager()
        appDelegate?.application(nil, didFinishLaunchingWithOptions: nil)
        
        let topViewController =
        appDelegate?.navController?.topViewController
        
        XCTAssertTrue(topViewController is MenuViewController,
            "Menu view controlelr is root VC for nav controller")
    }
    
    func testWindowIsKeyAfterAppIsLaunched() {
        appDelegate?.application(nil, didFinishLaunchingWithOptions: nil)
        XCTAssertTrue(window!.keyWindow,
            "App delegate's window should be the key window for the app")
    }
    
    func testAppDidFinishLaunchingDelegateMethodAlwaysReturnsTrue() {
        didFinishLaunchingWithOptionsReturnValue =
            appDelegate?.application(nil,
                didFinishLaunchingWithOptions: nil)
        
        XCTAssertTrue(didFinishLaunchingWithOptionsReturnValue!,
            "Did finish launching delegate method should return true")
    }
}
