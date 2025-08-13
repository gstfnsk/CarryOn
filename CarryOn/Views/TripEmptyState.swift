//
//  TripEmptyState.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 07/08/25.
//

import SwiftUI

struct TripEmptyState: View {
    var body: some View {
        VStack {
            VStack(spacing: 40){
                Text("Sua lista ainda está vazia")
                Image(.tripEmptyState)
                    .resizable()
                    .frame(width: 135, height: 125)
                Text("Importe uma lista ou adicione itens")
            }
        }
    }
}

#Preview {
    TripEmptyState()
}
