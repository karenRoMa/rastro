//
//  TutorialStrings.swift
//  Kirola
//
//  Created by Karen Rodriguez on 30/10/18.
//  Copyright © 2018 Yamblet. All rights reserved.
//

import Foundation

enum TutorialStrings: String {
    // CAROUSEL
    case firstTitle
    case firstContent
    case secondTitle
    case secondContent
    case thirdTitle
    case thirdContent
    
    var localized: String {
        return self.rawValue.camelToSnakeCase().localized(tableName: "Tutorial")
    }
}

