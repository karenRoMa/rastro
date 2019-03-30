//
//  CustomNavigationController.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/29/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.avenir(type: .none, size: 18.0)]
        navigationBar.isHidden = false
        navigationBar.barTintColor = UIColor.palidLila()
    }

}
