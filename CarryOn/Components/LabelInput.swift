//
//  LabelInput.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 08/08/25.
//

import SwiftUI

struct LabelInput: View {
    
    var label: String
    var placeholder: String
    @Binding var input: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(.system(.callout, weight: .semibold ))
            TextField(placeholder, text: $input)
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 8).foregroundStyle(.backgroundTertiary)
                )
            
        }
    }
}
