//
//  MainTabBarController.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 13.10.2022.
//

import UIKit

class MainTabBarController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialDarkGreen
        tabBar.unselectedItemTintColor = .specialGray
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.specialLightBrown.cgColor
    }
    
    private func setupItems() {
        let mainVC = MainViewController()
        let statisticVC = StatisticsViewController()
        let profileViewController = ProfileViewController()
        
        setViewControllers([mainVC, statisticVC, profileViewController], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Main"
        items[1].title = "Statistic"
        items[2].title = "Profile"
        
        
        items[0].image = UIImage(named: "MainIcon")
        items[1].image = UIImage(named: "StatisticIcon")
        items[2].image = UIImage(named: "ProfileIcon")
        
        UITabBarItem.appearance().setTitleTextAttributes([.font : UIFont(name: "Roboto-Bold", size: 12) as Any], for: .normal)
    }
}
