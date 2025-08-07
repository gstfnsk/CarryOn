//
//  Hygiene.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 06/08/25.
//

import Foundation

struct Item: Identifiable, Codable {
    let id: UUID = UUID()
    var name: String
    var category: ItemCategory?
}

