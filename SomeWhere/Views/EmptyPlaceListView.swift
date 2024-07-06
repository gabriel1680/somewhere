//
//  EmptyPlaceListView.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import SwiftUI

struct EmptyPlaceListView: View {
    var body: some View {
        VStack {
            Text("Parece você não tem nenhum para ir 😢")
            Button(action: {}, label: {
                Text("Adicoionar próxima parada")
                    .font(.headline)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.accentColor)
                    .cornerRadius(30)
            }).padding()
        }
    }
}

#Preview {
    EmptyPlaceListView()
}
