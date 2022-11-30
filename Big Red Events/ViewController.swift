//
//  ViewController.swift
//  Big Red Events
//
//  Created by Jason Xiong and Tina Sherpa on 11/30/22.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .systemRed
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        tabBar.layer.shadowOpacity = 0.5
        tabBar.layer.shadowOffset = CGSize.zero
        tabBar.layer.shadowRadius = 5
        self.tabBar.layer.borderColor = UIColor.clear.cgColor
        self.tabBar.layer.borderWidth = 0
        self.tabBar.clipsToBounds = false
        self.tabBar.backgroundColor = UIColor.white
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tab1 = DiscoverViewController()
        let tab1Item = UITabBarItem(title: "Discover", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        tab1.tabBarItem = tab1Item
        
        let tab2 = SavedViewController()
        let tab2Item = UITabBarItem(title: "Saved", image: UIImage(systemName: "heart"), tag: 0)
        tab2.tabBarItem = tab2Item
        
        let tab3 = AddViewController()
        let tab3Item = UITabBarItem(title: "Add Event", image: UIImage(systemName: "plus"), tag: 0)
        tab3.tabBarItem = tab3Item
        
        self.viewControllers = [tab1,tab2,tab3]
    }
}

