//
//  Report.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/30/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import UIKit
import MapKit

struct Report {
    var images: [UIImage]
    var description: String
    var location: CLLocation
    var likes: Int
    var dislikes: Int
    var comments: [Comment]
}

struct Comment {
    var user: User
    var message: String
}
