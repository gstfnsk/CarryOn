//
//  CategoryList.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 06/08/25.
//

import SwiftUI
import SwiftData


struct CategoryList: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var insertItem : Bool = false
    
    var category : ItemCategory = .electronics
    @Query var items: [Item]
    
    var body: some View {
        VStack {
            List(items) { item in
                if item.category == category {
                    HStack {
                        Text(item.name)
                        //                                .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden, edges:.bottom)
                        Button {
                            insertItem.toggle()
                            print(item.name)
                        } label: {
                            if insertItem {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                    
                }
            } //.listStyle(.)
        }
        .navigationTitle(category.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if items.isEmpty {
                for item in Item.predefinedItems {
                    modelContext.insert(item)
                }
                do {
                    try modelContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Voltar")
                        .padding(.vertical, 14)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}


//#Preview {
//    CategoryList()
//}
