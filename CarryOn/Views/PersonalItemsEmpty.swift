//
//  PersonalItemsEmpty.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 11/08/25.
//

import SwiftUI

struct PersonalItemsEmpty: View {
    var body: some View {
        VStack(spacing: 8){
            Image(.tripsEmptyState)
                .resizable()
                .frame(width: 121, height: 203)
            
        }
    }
}

#Preview {
    PersonalItemsEmpty()
}
