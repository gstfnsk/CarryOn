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
                Image(.tripsEmptyState)
                    .resizable()
                    .frame(width: 121, height: 203)
                Text("Crie listas de viagens e elas aparecerão aqui")
                
            }
        }
    }
}

#Preview {
    TripEmptyState()
}
