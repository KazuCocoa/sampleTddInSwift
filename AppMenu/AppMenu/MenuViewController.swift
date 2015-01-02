//
//  MenuViewController.swift
//  AppMenu
//
//  Created by KazuakiMATSUO on 1/2/15.
//  Copyright (c) 2015 KazuakiMATSUO. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource: MenuTableDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "App Menu"
        //tableView.delegate = dataSource
        //tableView.dataSource = dataSource

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "didSelectMenuItemNotification:",
            name: MenuTableDataSourceDidSelectItemNotification,
            object: nil)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: MenuTableDataSourceDidSelectItemNotification,
            object: nil)
    }
    
    func didSelectMenuItemNotification(notification: NSNotification?) {
        var menuItem: MenuItem? = notification!.object as? MenuItem
        
        if menuItem != nil {
            var tapHandler: UIViewController?
            
            switch menuItem!.tapHandlerName! {
            case "ContributionsViewController":
                tapHandler =
                    ContributionsViewController(
                        nibName: "ContributionsViewController",
                        bundle: nil)
                
            case "RepositoriesViewController":
                tapHandler =
                    RepositoriesViewController(
                        nibName: "RepositoriesViewController",
                        bundle: nil)
                
            case "PublicActivityViewController":
                tapHandler =
                    PublicActivityViewController(
                        nibName: "PublicActivityViewController",
                        bundle: nil)
                
            default:
                tapHandler = nil
            }
            
            if tapHandler != nil {
                self.navigationController?.pushViewController(tapHandler!,
                    animated: true)
            }
        }
    }

}
