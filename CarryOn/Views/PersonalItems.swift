//
//  PersonalItems.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 05/08/25.
//

import SwiftUI

struct PersonalItems: View {
    
    @State var addItem: Bool = true
    var body: some View {
        VStack {
            VStack(spacing: 22) {
                Text("Minha lista de indispensáveis")
                    .font(.system(.title3, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle("Itens essenciais")
        }
        .sheet(isPresented: $addItem) { // $ binding<bool>: observable
            AddItem()
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    PersonalItems()
}
