//
//  Electronics.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 06/08/25.
//

import Foundation

enum ItemCategory: String, CaseIterable, Identifiable, Codable {
    case electronics = "Eletrônicos"
    case hygiene = "Higiene"
    case clothes = "Roupas"
    case footwear = "Calçados"
    case documents = "Documentos"
    case accessories = "Acessórios"
    case health = "Saúde"
    case miscellaneous = "Diversos"
    case camping = "Natureza"
    case beach = "Praia"
    case work = "Trabalho"
    case concert = "Show"
    case international = "Internacional"
    case others = "Outros"
    
    var id: String { rawValue }
    
    var imageName: String {
        switch self {
        case .electronics:
            return "macbook.and.iphone"
        case .hygiene:
            return "shower"
        case .clothes:
            return "tshirt"
        case . footwear:
            return "shoe"
        case .documents:
            return "wallet.bifold"
        case .accessories:
            return "hat.cap"
        case .health:
            return "pill"
        case .miscellaneous:
            return "ellipsis"
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
    
    var row: String {
        switch self {
        case .electronics:
            return "first"
        case .hygiene:
            return "first"
        case .clothes:
            return "first"
        case . footwear:
            return "first"
        case .documents:
            return "first"
        case .accessories:
            return "first"
        case .health:
            return "first"
        case .miscellaneous:
            return "first"
        case .camping:
            return "second"
        case .beach:
            return "second"
        case .work:
            return "second"
        case .concert:
            return "second"
        case .international:
            return "second"
        case .others:
            return "second"
        }
    }
}
