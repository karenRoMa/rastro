//
//  ProfileViewController.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/29/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    weak var coordinator: RastroCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        addPanicButton()
    }
    
    // MARK: - IBActions -
    
    @IBAction func goToEmergencyContacts(_ sender: Any) {
        
    }
    
    @IBAction func goToRoutes(_ sender: Any) {
        
    }
    
    @IBAction func logout(_ sender: Any) {
        coordinator?.logout()
    }
    
    
}
