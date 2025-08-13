//
//  PersonalItemsEmpty.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 11/08/25.
//

import SwiftUI

struct PersonalItemsEmpty: View {
    var body: some View {
        VStack{
            VStack(spacing: 40){
                Text("Sua lista ainda está vazia")
                Image(.myItemsEmptyState)
                    .resizable()
                    .frame(width: 286, height: 153)
                Text("Adicione itens e eles aparecerão aqui")
            }
        }.padding(.top, 42)
    }
}

#Preview {
    PersonalItemsEmpty()
}
