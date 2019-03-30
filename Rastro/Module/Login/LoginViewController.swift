//
//  LoginViewController.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/29/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IBOutlets -
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: LoadingButton!
    @IBOutlet weak var registerButton: UIButton!
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        title = ""
        emailTextField.applyAppStyle()
        passwordTextField.applyAppStyle()
        loginButton.applyEnabledButtonStyle()
        registerButton.applyEnabledButtonStyle()
    }
    // MARK: - IBActions -
    
    @IBAction func login(_ sender: Any) {
        coordinator?.goToRastro()
    }
    
    @IBAction func goToRegister(_ sender: Any) {
        coordinator?.goToRegister()
    }

}
