//
//  UIViewControllerExtension.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/29/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit

extension UIViewController {
    func addPanicButton() {
        let panicButton = PanicButton()
        panicButton.bounds = CGRect(x: view.bounds.width-30, y: view.bounds.height-30, width: 100, height: 100)
        view.addSubview(panicButton)
    }
}
