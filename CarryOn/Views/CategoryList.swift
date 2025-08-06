//
//  CategoryList.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 06/08/25.
//

import SwiftUI

var category : ItemCategory = .electronics

struct CategoryList: View {
    var body: some View {
        VStack {
            NavigationStack {
                ScrollView {
                    List(PredefinedItems.electronics) {item in
                        Text(item.name)
                    }
                }
            }
        }
        .navigationTitle(category.rawValue)
    }
}

#Preview {
    CategoryList()
}
