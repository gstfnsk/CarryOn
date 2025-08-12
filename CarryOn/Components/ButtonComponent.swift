//
//  ButtonComponent.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 08/08/25.
//

import SwiftUI

struct ButtonComponent: View {
    
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 14)
            .background(RoundedRectangle(cornerRadius: 16).foregroundStyle(.gray3))
        }
    }
}

#Preview {
    ButtonComponent(text: "Criar nova lista"){
        print("aaa")
    }
}
