//
//  FontType.swift
//  MiTPV
//
//  Created by Karen Rodriguez on 12/11/18.
//  Copyright © 2018 Yamblet. All rights reserved.
//

import Foundation

enum FontType: String {
    case none = ""
    case black = "Black"
    case blackItalic = "BlackItalic"
    case bold = "Bold"
    case boldItalic = "BoldItalic"
    case extraBold = "ExtraBold"
    case extraBoldItalic = "ExtraBoldItalic"
    case extraLight = "ExtraLight"
    case extraLighItalic = "ExtraLightItalic"
    case italic = "Italic"
    case light = "Light"
    case lightItalic = "LightItalic"
    case medium = "Medium"
    case mediumItalic = "MediumItalic"
    case regular = "Regular"
    case semiBold = "SemiBold"
    case semiBoldItalic = "SemiBoldItalic"
    case thin = "Thin"
    case thinItalic = "ThinItalic"
    
    var fontName: String {
        return "Avenir"
    }
    
    var fullString: String {
        if self == .none {
            return fontName
        }
        return "\(fontName)-\(self.rawValue)"
    }
}
