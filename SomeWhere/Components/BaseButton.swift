//
//  BaseButton.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 09/07/24.
//

import SwiftUI


struct BaseButton: View {
    var label: String
    var action: () -> Void
    
    init(_ label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }
    
    var body: some View {
        Button(action: action, label: {
            Text(label)
                .font(.headline)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(height: 55)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(Color.accentColor)
                .cornerRadius(30)
        })
    }
}

#Preview {
    BaseButton("Text", action: {})
}
