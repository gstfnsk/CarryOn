//
//  Hygiene.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 06/08/25.
//

import Foundation

struct Item: Identifiable {
    let id: UUID = UUID()
    var name: String
    var description: String?
    var category: ItemCategory?
}

