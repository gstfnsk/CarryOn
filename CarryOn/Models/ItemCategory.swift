//
//  Electronics.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 06/08/25.
//

import Foundation

enum ItemCategory: String, CaseIterable, Identifiable, Codable {
    case electronics
    case hygiene
    case clothes
    case footwear
    case documents
    case accessories
    case health
    case bag
    case miscellaneous
    
    var id: String { rawValue }
}
