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
    case footwear = "Calcados"
    case documents = "Documentos"
    case accessories = "Acessórios"
    case health = "Saúde"
    case miscellaneous = "Outros"
    
    var id: String { rawValue }
}
