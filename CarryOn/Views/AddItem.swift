//
//  AddItem.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 11/08/25.
//

import SwiftUI
import SwiftData

struct AddItem: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var item: String = ""
    @Binding var selectedCategory: ItemCategory?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 8){
                    Text("Adicionar item")
                        .font(.system(.callout, weight: .semibold ))
                    TextField("Insira o item", text: $item)
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 8).foregroundStyle(.backgroundTertiary)
                        )
                }
                .padding()
                VStack(spacing: 12) {
                    Text("Adicionar por categoria")
                        .font(.system(.callout, weight: .semibold ))
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            ForEach (ItemCategory.allCases) { category in
                                if category.row == "first"{
                                    CategoryButton(text: category.rawValue, image: Image(systemName: category.imageName)){
                                        selectedCategory = category
                                        dismiss()
                                    }
                                }
                            }
                        }
                    }
                    Text("Adicionar por tipo de viagem")
                        .font(.system(.callout, weight: .semibold ))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach (ItemCategory.allCases) { category in
                                if category.row == "second"{
                                    CategoryButton(text: category.rawValue, image: Image(systemName: category.imageName)){
                                        selectedCategory = category
                                        dismiss()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
//#Preview {
//    AddItem()
//}
