//
//  CategoryCard.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 11/08/25.
//

import SwiftUI

struct CategoryButton: View {
    
    var text: String = ""
    var image = Image(systemName: "ellipsis")
//    var action: () -> Void
    
    var body: some View {
        Button {
//            action()
        } label: {
            VStack (){
                image
                    .frame(maxHeight: 41)
                Text(text)
            }.frame(width: 80, height: 80, alignment: .center)
//                .padding(.horizontal, 8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(.backgroundSecondary)
                )
        }
    }
}

#Preview {
    CategoryButton(text: "test", image: Image(systemName: "ellipsis"))
}

