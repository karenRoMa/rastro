//
//  MainTabBarController.swift
//  GriniOSDev
//
//  Created by Karen Rodriguez on 3/26/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Stored Properties -
    
    /// Main Coordinator instance
    weak var coordinator: RastroCoordinator?

    // MARK - View Delegate Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setControllers()
    }

    // MARK: - View configuration -
    
    func configureView() {
        UITabBar.appearance().tintColor = UIColor.purple()
    }
    
    // MARK: - Class Methods -
    
    func setControllers() {
        let communityController = CommunityViewController()
        communityController.coordinator = coordinator
        let mapController = MapViewController()
        mapController.coordinator = coordinator
        let profileController = ProfileViewController()
        profileController.coordinator = coordinator
        viewControllers = [communityController, mapController, profileController]
        setTabBarItems()
        selectedIndex = 1
    }

    /// Set the items in the tab bar controller
    func setTabBarItems() {
        for (index, viewController) in viewControllers!.enumerated() {
            var item: UITabBarItem = UITabBarItem()
            switch index {
            case 0:
                item = UITabBarItem(title: "", image: UIImage(named: "advertising"), tag: 0)
            case 1:
                item = UITabBarItem(title: "", image: UIImage(named: "map_marker"), tag: 1)
            case 2:
                item = UITabBarItem(title: "", image: UIImage(named: "profile"), tag: 2)
            default:
                break
            }
            viewController.tabBarItem = item
        }
    }
}
