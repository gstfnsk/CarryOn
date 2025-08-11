//
//  AddItem.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 11/08/25.
//

import SwiftUI
import SwiftData

struct AddItem: View {
    
    @State var item: String = ""
    
    var body: some View {
        VStack(spacing: 8){
            Text("Adicionar item")
                .font(.system(.callout, weight: .semibold ))
            TextField("Insira o item", text: $item)
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 8).foregroundStyle(.backgroundTertiary)
                )
                
        }.padding()
            Spacer()
        VStack(spacing: 12) {
            Text("Adicionar por categoria")
                .font(.system(.callout, weight: .semibold ))
            HStack {
                ForEach (ItemCategory.allCases) { category in
                    CategoryButton(text: category.rawValue, image: Image(systemName: category.imageName))
                }
//            Spacer()
            }
            Text("Adicionar por tipo de viagem")
                .font(.system(.callout, weight: .semibold ))
            HStack {
                ForEach (ItemTripType.allCases) { category in
                    CategoryButton(text: category.rawValue, image: Image(systemName: category.imageName))
                }
            }
        }
    }
}

#Preview {
    AddItem()
}
