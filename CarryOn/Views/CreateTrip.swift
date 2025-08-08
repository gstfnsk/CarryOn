//
//  CreateTrip.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 05/08/25.
//

import SwiftUI
import SwiftData

struct CreateTrip: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var name: String = ""
    @State var details: String = ""
    
    @Query var trips: [Trip]
    
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
                        TextField("Opcional", text: $details)
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
                if !name.isEmpty {
                    let newTrip = Trip(name: name, details: details)
                    modelContext.insert(newTrip)
                    print(newTrip)
                }
                
                // go to trip page
//                confirmCreation = true
            }.padding(56)
        }
    }
}

//#Preview {
//    CreateTrip()
//}
