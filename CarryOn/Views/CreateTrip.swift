//
//  CreateTrip.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 05/08/25.
//

import SwiftUI

struct CreateTrip: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var name: String = ""
    @State var description: String = ""
    
    var confirmCreation: Bool = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 24) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Nome da lista")
                            .font(.system(.callout, weight: .semibold ))
                        TextField("Dê um nome a sua lista de viagem", text: $name)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 8).foregroundStyle(.backgroundTertiary)
                            )
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Descrição")
                            .font(.system(.callout, weight: .semibold ))
                        TextField("Opcional", text: $description)
                            .padding(.vertical, 12)
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 8).foregroundStyle(.backgroundTertiary)
                            )
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Foto")
                            .font(.system(.callout, weight: .semibold ))
                    }
                    
                }.padding(24)
            }
            ButtonComponent(text: "Criar lista") {
                // create trip
                // go to trip page
//                confirmCreation = true
            }.padding(56)
        }
    }
}

//#Preview {
//    CreateTrip()
//}
