//
//  AddPlaceFormView.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import SwiftUI

struct AddPlaceFormView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: PlaceListViewModel
    @State var titleText: String = ""
    @State var descriptionText: String = ""
    
    var body: some View {
        ScrollView {
            VStack (spacing: 16) {
                TextField("Nome do restaurante", text: $titleText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(white: 0.9, opacity: 0.7))
                    .cornerRadius(6)
                TextField("Descrição", text: $descriptionText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(white: 0.9, opacity: 0.7))
                    .cornerRadius(6)
                Spacer()
                Button(action: addPalce, label: {
                    Text("Salvar")
                        .textCase(.uppercase)
                        .font(.headline)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .cornerRadius(30)
                })
            }
            .padding(16)
        }
        .navigationTitle("Novo Desejo")
    }
    
    func addPalce() {
        viewModel.addPlace(title: titleText, description: descriptionText)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    NavigationView {
        AddPlaceFormView()
            .environmentObject(PlaceListViewModel())
    }
}
