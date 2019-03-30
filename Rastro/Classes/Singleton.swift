//
//  Singleton.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/30/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import Foundation
import MapKit

class Singleton {
    
    static var shared = Singleton()
    
    var currentUser: User = User()
    var incidents: [Entry] =  [
        Entry(incidentDetail: Incident(location: CLLocation(latitude: 19.519264, longitude: -99.021386), riskType: .high, relatedReports: []), reportDetail: nil, type: .incident),
        Entry(incidentDetail: Incident(location: CLLocation(latitude: 19.488734, longitude: -99.106559), riskType: .medium, relatedReports: []), reportDetail: nil, type: .incident),
        Entry(incidentDetail: Incident(location: CLLocation(latitude: 19.435236, longitude: -99.140353), riskType: .none, relatedReports: []), reportDetail: nil, type: .incident)
    ]

    var reports: [Entry] = [
        Entry(incidentDetail: nil, reportDetail: Report(images: [], description: "Auto pasó a máxima velocidad por Plaza de la Independencia", location: CLLocation(latitude: 19.488734, longitude: -99.106559), likes: 3, dislikes: 0, comments: []), type: .report),
        Entry(incidentDetail: nil, reportDetail: Report(images: [], description: "Hombre peleando a gritos contra una mujer de aproximadamente 25 años de edad.", location: CLLocation(latitude: 19.370738, longitude: -99.265837), likes: 6, dislikes: 2, comments: []), type: .report),
        Entry(incidentDetail: nil, reportDetail: Report(images: [], description: "Hombre de aproximadamente 35 años ha pasado varias veces por aquí y parece que vigila a alguien", location: CLLocation(latitude: 19.372008, longitude: -99.261207), likes: 1, dislikes: 1, comments: []), type: .report),
        Entry(incidentDetail: nil, reportDetail: Report(images: [], description: "Mujer pasó corriendo por la calle y parecía asustada", location: CLLocation(latitude: 19.367276, longitude: -99.263563), likes: 5, dislikes: 0, comments: []), type: .report),
        Entry(incidentDetail: nil, reportDetail: Report(images: [], description: "Joven encapuchado lleva media hora sentado en la banqueta", location: CLLocation(latitude: 19.374442 , longitude: -99.264378), likes: 10, dislikes: 1, comments: []), type: .report)
    ]
}
