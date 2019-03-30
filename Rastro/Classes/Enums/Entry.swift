//
//  Entry.swift
//  Rastro
//
//  Created by Karen Rodriguez on 3/30/19.
//  Copyright © 2019 Karen Rodriguez. All rights reserved.
//

import Foundation

enum EntryType {
    case incident
    case report
}

struct Entry {
    var incidentDetail: Incident?
    var reportDetail: Report?
    var type: EntryType
}
