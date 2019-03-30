//
//  RastroCoordinator.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/29/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit

class RastroCoordinator: Coordinator {
    var window: UIWindow
    weak var parentCoordinator: MainCoordinator?
    var rootNavigationController: CustomNavigationController
    
    var tabController: MainTabBarController!
    
    init(window: UIWindow) {
        self.window = window
        rootNavigationController = CustomNavigationController()
    }
    
    func start() {
        rootNavigationController = CustomNavigationController()
        tabController = MainTabBarController()
        tabController.coordinator = self
 
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.window.rootViewController = self.tabController
            self.window.makeKeyAndVisible()
        }, completion: nil)
    }
    
    func goToReport(with report: Report?) {
        let reportDetail = ReportDetailViewController()
        reportDetail.report = report
        reportDetail.modalTransitionStyle = .crossDissolve
        reportDetail.modalPresentationStyle = .overCurrentContext
        tabController.present(reportDetail, animated: true)
    }
    
    func goToIncidentDetail(with incident:Incident, from: UIViewController) {
        let reportDetail = IncidentDetailViewController()
        reportDetail.incident = incident
        reportDetail.modalTransitionStyle = .crossDissolve
        reportDetail.modalPresentationStyle = .overCurrentContext
        from.present(reportDetail, animated: true)
    }
    
    func logout() {
        parentCoordinator?.startApp()
    }
}
