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
            VStack {
                TextField("Insert the Title", text: $titleText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(white: 0.9, opacity: 0.7))
                    .cornerRadius(6)
                TextField("Insert the Description", text: $descriptionText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(white: 0.9, opacity: 0.7))
                    .cornerRadius(6)
                Button(action: addPalce, label: {
                    Text("Save")
                        .textCase(.uppercase)
                        .font(.headline)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .cornerRadius(6)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add something")
    }
    
    func addPalce() {
        viewModel.addPlace(title: titleText, description: descriptionText)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    AddPlaceFormView()
        .environmentObject(PlaceListViewModel())
}
