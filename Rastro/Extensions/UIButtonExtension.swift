//
//  UIButtonExtension.swift
//  MiTPV
//
//  Created by Karen Rodriguez on 30/10/18.
//  Copyright © 2018 Yamblet. All rights reserved.
//

import Foundation
import UIKit
import pop

extension UIButton {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.addBounceAnimationTargets()
        
        let localizedTitle = title(for: .normal)?.localized(bundle: .main, tableName: "UI")
        setTitle(localizedTitle, for: .normal)
    }
    
    /// Add bounce animation to button
    func addBounceAnimationTargets() {
        self.addTarget(self, action: #selector(buttonPressed), for: [.touchDown])
        self.addTarget(self, action: #selector(buttonReleased), for: [.touchDragExit, .touchUpInside, .touchUpOutside, .touchCancel])
    }
    
    /// Contract the button view
    @objc func buttonPressed(_ sender: UIButton) {
        sender.contract(withDuration: 0.1) { _, _ in}
    }
    
    /// Expands the button view
    @objc func buttonReleased(_ sender: UIButton) {
        sender.expand(withBounce: 10.0)
    }
    
    // MiTPV Styles
    
    func applyEnabledButtonStyle(rounded: Bool = true) {
        round()
        setTitleColor(UIColor.white, for: .normal)
        titleLabel?.font = UIFont.avenir(type: .none, size: 17.0)
        backgroundColor = UIColor.purple()
        applyShadow(opacity: 0.3)
    }
    
    func applyEnabledButtonStyleFlat() {
        backgroundColor = UIColor.lightGray()
        titleLabel?.font = UIFont.avenir(type: .none, size: 17.0)
        setTitleColor(UIColor.palidLila(), for: .normal)
    }
    
    func applyDisabledButtonStyle() {
        titleLabel?.font = UIFont.avenir(type: .none, size: 17.0)
        layer.masksToBounds = true
        layer.cornerRadius = bounds.height/2
        layer.borderColor = UIColor.lightGray().cgColor
        layer.borderWidth = 1.0
        backgroundColor = UIColor.clear
        setTitleColor(UIColor.lightGray(), for: .normal)
    }
    
    func applySelectedStyle() {
        backgroundColor = UIColor.mediumPurple()
        round(with: 5.0)
        setTitleColor(UIColor.white, for: .normal)
    }
    
    func applyUnselectedStyle() {
        backgroundColor = UIColor.darkGray
        round(with: 5.0)
        setTitleColor(UIColor.lightGray, for: .normal)
    }
    
}
