//
//  CustomLaunchScreenViewController.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/29/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import Lottie

class CustomLaunchViewController: UIViewController {
    
    // MARK: - View Delegate Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // MARK: - View Configuation -
    
    func configureView() {
        
        view.backgroundColor = UIColor.lightGray()
        
        // Load Lottie view
        let lottieView = LOTAnimationView(name: "loading")
        lottieView.bounds = CGRect(x: 0, y: 0, width: 350, height: 250)
        lottieView.center = view.center
        lottieView.clipsToBounds = true
        view.addSubview(lottieView)
        lottieView.loopAnimation = true
        lottieView.play()
    }
}
