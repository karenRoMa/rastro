//
//  UIColorExtension.swift
//  GriniOSDev
//
//  Created by Karen Rodriguez on 3/26/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit

/**
 This Extension help us declare all the colors we will need in the project
 
 - @nonobjc attribute indicates that this variable can't be migrated to Objective-C
 - class func indicates that it can be overriden if needed in any class
 
 the default opacity for all colors is 1.0
 */
extension UIColor {
    
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    // MARK: - Main App Colors -
    
    @nonobjc class func darkPurple(opacity: CGFloat = 1.0) -> UIColor {
        return UIColor.hexStringToUIColor(hex: "1D2560").withAlphaComponent(opacity)
    }
    
    @nonobjc class func lightGray(opacity: CGFloat = 1.0) -> UIColor {
        return UIColor.hexStringToUIColor(hex: "E5E5E5").withAlphaComponent(opacity)
    }
    
    @nonobjc class func palidLila(opacity: CGFloat = 1.0) -> UIColor {
        return UIColor.hexStringToUIColor(hex: "C3B3BE").withAlphaComponent(opacity)
    }
    
    @nonobjc class func grayPurple(opacity: CGFloat = 1.0) -> UIColor {
        return UIColor.hexStringToUIColor(hex: "8F93A5").withAlphaComponent(opacity)
    }
    
    @nonobjc class func purple(opacity: CGFloat = 1.0) -> UIColor {
        return UIColor.hexStringToUIColor(hex: "626A96").withAlphaComponent(opacity)
    }
    
    @nonobjc class func dark(opacity: CGFloat = 1.0) -> UIColor {
        return UIColor.hexStringToUIColor(hex: "1C1522").withAlphaComponent(opacity)
    }
    
    @nonobjc class func mediumPurple(opacity: CGFloat = 1.0) -> UIColor {
        return UIColor.hexStringToUIColor(hex: "3E4880").withAlphaComponent(opacity)
    }
    
    @nonobjc class func coral(opacity: CGFloat = 1.0) -> UIColor {
        return UIColor.hexStringToUIColor(hex: "fa7268").withAlphaComponent(opacity)
    }
    
}
