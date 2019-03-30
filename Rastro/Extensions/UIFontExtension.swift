//
//  UIFontExtension.swift
//  MiTPV
//
//  Created by Karen Rodriguez on 15/11/18.
//  Copyright © 2018 Yamblet. All rights reserved.
//

import UIKit

extension UIFont {
    class func avenir(type: FontType, size: CGFloat) -> UIFont {
        return UIFont(name: type.fullString, size: size)!
    }
}
