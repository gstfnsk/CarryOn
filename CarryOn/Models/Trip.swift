//
//  Trip.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 06/08/25.
//

import Foundation

struct Trip: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
//    var category: TaskCategory
//    var isCompleted: Bool = false
}
