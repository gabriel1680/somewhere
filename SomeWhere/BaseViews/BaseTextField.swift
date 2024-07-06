//
//  BaseTextField.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import SwiftUI

struct BaseTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("", text: $text)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(white: 0.9, opacity: 0.7))
                .cornerRadius(6)
        }
    }
}

#Preview {
    BaseTextField(placeholder: "some", text: Binding(get: {""}, set: { Value in }))
}
