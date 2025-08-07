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
        var id: UUID = UUID()
        var name: String
        var details: String?
        var startDate: Date?
        var endDate: Date?
    
    init(name: String, details: String? = nil, startDate: Date? = nil, endDate: Date? = nil) {
        self.name = name
        self.details = details
        self.startDate = startDate
        self.endDate = endDate
    }
}


