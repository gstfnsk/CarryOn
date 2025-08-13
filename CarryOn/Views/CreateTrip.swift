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
                        LabelInput(label: "Nome da lista", placeholder: "Dê um nome a sua lista de viagem", input: $name)
                    LabelInput(label: "Descrição", placeholder: "Opcional", input: $details)
                }.padding(24)
                    .padding(.top, 51)
            }
            ButtonComponent(text: "Criar lista") {
                if !name.isEmpty {
                    let newTrip = Trip(name: name, details: details)
                    modelContext.insert(newTrip)
                    dismiss()
                }
            }.padding(56)
        }.navigationTitle("Nova lista")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.backgroundPrimary)
    }
}

//#Preview {
//    CreateTrip()
//}
