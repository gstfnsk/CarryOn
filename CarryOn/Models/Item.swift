//
//  Hygiene.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 06/08/25.
//

import Foundation
import SwiftData

@Model
final class Item: Identifiable {
        let id: UUID = UUID()
        var name: String
        var details: String?
        var category: ItemCategory?
    
    init(name: String, details: String? = nil, category: ItemCategory? = nil) {
        self.name = name
        self.details = details
        self.category = category
    }
}


