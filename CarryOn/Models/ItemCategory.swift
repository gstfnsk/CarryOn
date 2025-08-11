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
    case miscellaneous = "Outros"
    
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
        
        }
    }
}
