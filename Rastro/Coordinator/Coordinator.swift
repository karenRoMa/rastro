//
//  Coordinator.swift
//  GriniOSDev
//
//  Created by Karen Rodriguez on 3/26/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    // App Window
    var window: UIWindow { get set }
    
    // Root Controller of the coordinator
    var rootNavigationController: CustomNavigationController { get set }
    
    func start()
}
