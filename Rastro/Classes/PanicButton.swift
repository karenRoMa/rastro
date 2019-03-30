//
//  PanicButton.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/29/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit

class PanicButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        configureButtonStyle()
    }
    
    func configureButtonStyle() {
        setTitle("ME SIENTO INSEGURA", for: .normal)
        titleLabel?.numberOfLines = 2
        titleLabel?.textAlignment = .center
        round()
        setTitleColor(UIColor.white, for: .normal)
        titleLabel?.font = UIFont.avenir(type: .none, size: 15.0)
        backgroundColor = UIColor.coral()
        applyShadow(opacity: 0.5)
    }
}
