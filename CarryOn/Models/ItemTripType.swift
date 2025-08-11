//
//  ItemTripType.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 11/08/25.
//

import Foundation

enum ItemTripType: String, CaseIterable, Identifiable, Codable {
    case camping = "Natureza"
    case beach = "Praia"
    case work = "Trabalho"
    case concert = "Show"
    case international = "Internacional"
    case others = "Outros"
    
    var id: String { rawValue }
    
    var imageName: String {
        switch self {
        case .camping:
            return "tent"
        case .beach:
            return "beach.umbrella"
        case .work:
            return "suitcase"
        case .concert:
            return "music.microphone"
        case .international:
            return "airplane"
        case .others:
            return "ellipsis"
        }
    }
}
