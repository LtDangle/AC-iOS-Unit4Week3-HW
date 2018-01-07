//
//  TabBarController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        let navBarController = UINavigationController(rootViewController: MainWeatherViewController())
        let favVC = FavoriteImagesViewController()
        navBarController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        favVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let tabBarItemsList = [navBarController, favVC]
        self.viewControllers = tabBarItemsList
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
