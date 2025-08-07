//
//  Trip.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 06/08/25.
//

import Foundation
import SwiftData

@Model
final class Trip: Identifiable {
        var name: String
        var items: [Item]? = []
        var details: String?
        var startDate: Date?
        var endDate: Date?
    
    init(name: String, items: [Item] = [], details: String? = nil, startDate: Date? = nil, endDate: Date? = nil) {
        self.name = name
        self.items = items
        self.details = details
        self.startDate = startDate
        self.endDate = endDate
    }
}


