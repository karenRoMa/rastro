//
//  RegisterViewController.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/29/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - IBOutlets -
    
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }
    
    func configureView() {
        nameTextField.applyAppStyle()
        emailTextField.applyAppStyle()
        passwordTextField.applyAppStyle()
        ageTextField.applyAppStyle()
        genderTextField.applyAppStyle()
        registerButton.applyEnabledButtonStyle()
    }


    @IBAction func register(_ sender: Any) {
        coordinator?.goToRastro()
    }
}
