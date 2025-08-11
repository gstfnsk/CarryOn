//
//  Trip.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 06/08/25.
//

import Foundation
import SwiftData

@Model
final class PickedItems {
        var items: [Item] = []
    
    init(items: [Item] = []) {
        self.items = items
    }
}


