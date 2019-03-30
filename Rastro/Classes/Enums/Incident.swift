//
//  Incident.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/30/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import MapKit

struct Incident {
    var location: CLLocation
    var riskType: RiskType
    var relatedReports: [Report] = []
}
