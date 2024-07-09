//
//  BaseTextField.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 09/07/24.
//

import SwiftUI

struct BaseTextField: View {
    let label: String
    @Binding var text: String
    
    var body: some View {
        TextField(label, text: $text)
            .padding(.horizontal)
            .frame(height: 55)
            .background(Color(white: 0.9, opacity: 0.7))
            .cornerRadius(6)
    }
}

#Preview {
    BaseTextField(
        label: "Text",
        text: Binding(get: { return "" }, set: {_ in })
    )
}
