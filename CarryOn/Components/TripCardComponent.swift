//
//  ButtonComponent.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 08/08/25.
//

import SwiftUI

struct TripCardComponent: View {
    
    var text: String
    var action: () -> Void
    
    var body: some View {
            Button {
                action()
            } label: {
                Text(text)
                    .padding(.leading, 16)
                    .padding(.top, 14)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .background(RoundedRectangle(cornerRadius: 16).foregroundStyle(.gray3))
            }
    }
}

#Preview {
    TripCardComponent(text: "Criar nova lista"){
        print("aaa")
    }
}
