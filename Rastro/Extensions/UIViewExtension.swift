//
//  UIViewExtension.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/29/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit

extension UIView {
    func applyShadow(color: UIColor = UIColor.black, opacity: Float = 1.0, radius: CGFloat = 5.0, verticalOffset: CGFloat = 0, horizontalOffset: CGFloat = 0) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: horizontalOffset, height: verticalOffset)
        layer.shadowRadius = 5
        layer.masksToBounds = false
    }
    
    /// Round specific corners
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        layer.masksToBounds = true
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func round(with radius: CGFloat? = nil) {
        if radius != nil {
            layer.cornerRadius = radius!
        } else {
            layer.cornerRadius = self.bounds.height/2
        }
        layer.masksToBounds = true
    }
}
