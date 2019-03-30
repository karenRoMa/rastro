//
//  MainCoordinator.swift
//  GriniOSDev
//
//  Created by Karen Rodriguez on 3/26/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit

/**
 This is the **Main Coordinator** that will help us define the flow in the entire app.
 Since this project is not to large the is only one coordinator needed.
 In bigger projects is better to use more coordinators.
 */
class MainCoordinator: Coordinator {
    
    // App Window
    var window: UIWindow
    
    // CONTROLLERS
    var rootNavigationController: CustomNavigationController
    
    var childCoordinator: RastroCoordinator

    /// View controller push or presented at the top of the app
    var topViewController: UIViewController? {
        if let presentedController = window.rootViewController?.presentedViewController {
            return presentedController
        } else {
            return window.rootViewController
        }
    }
    
    init(window: UIWindow) {
        self.window = window
        rootNavigationController = CustomNavigationController()
        childCoordinator = RastroCoordinator(window: window)
        childCoordinator.parentCoordinator = self
    }
    
    func start() {
        /*
         Show Launch Screen for 3 seconds
         In production case we can download information in
         Launch ViewController
         */
        
        self.window.rootViewController = CustomLaunchViewController()
        self.window.makeKeyAndVisible()
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(startApp), userInfo: nil, repeats: false)
    }
    
    @objc func startApp() {
        rootNavigationController = CustomNavigationController()
        let tutorialVC = WelcomeViewController()
        tutorialVC.coordinator = self
        rootNavigationController.pushViewController(tutorialVC, animated: false)
        
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.window.rootViewController = self.rootNavigationController
            self.window.makeKeyAndVisible()
        }, completion: nil)
    
    }

    func goToLogin() {
        let loginController = LoginViewController()
        loginController.coordinator = self
        rootNavigationController.pushViewController(loginController, animated: true)
    }
    
    func goToRegister() {
        let registerController = RegisterViewController()
        registerController.coordinator = self
        rootNavigationController.pushViewController(registerController, animated: true)
    }
    
    func goToRastro() {
        childCoordinator = RastroCoordinator(window: window)
        childCoordinator.parentCoordinator = self
        childCoordinator.start()
    }
    
}
