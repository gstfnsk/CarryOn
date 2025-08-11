//
//  CarryOnApp.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 05/08/25.
//

import SwiftUI
import SwiftData

@main
struct CarryOnApp: App {
    var body: some Scene {
        WindowGroup {
            TabBar()
        }
        .modelContainer(for: [Item.self, Trip.self, PickedItems.self])
    }
}
