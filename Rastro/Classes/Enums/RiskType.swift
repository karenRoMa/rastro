//
//  RiskType.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/30/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit

enum RiskType: String {
    case none
    case medium
    case high
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
    
    func message(with user: User) ->String {
        switch self {
        case .none:
            return "\(user.name.capitalized) llegó a salvo 🥳 \n "
        case .medium:
            return "\(user.name.capitalized) podría estar en peligro, mantente alerta y comunícate 😥. Te seguiremos informando..."
        case .high:
            return "Lamentamos informarte que \(user.name.capitalized) muy probablemente está en peligro 🥺, manten la calma e intenta comunicarte con \(user.name.capitalized) o contacta a personas que podrían estar cerca "
        }
    }
    
}
