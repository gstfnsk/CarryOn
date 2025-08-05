//
//  TabBar.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 05/08/25.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Tab("Viagens", systemImage: "duffle.bag") {
                NavigationStack {
                    Trips()
                }
            }
            Tab("Itens", systemImage: "list.bullet") {
                NavigationStack {
                    PersonalItems()
                }
            }
        }
    }
}

#Preview {
    TabBar()
}
