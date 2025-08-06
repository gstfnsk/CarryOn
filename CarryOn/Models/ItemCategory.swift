//
//  Electronics.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 06/08/25.
//

import Foundation

enum ItemCategory: String, CaseIterable, Identifiable {
    case electronics
    case hygiene
    case clothes
    case footwear
    case documents
    case accessories
    case medications
    case miscellaneous
    
    var id: String { rawValue }
}
