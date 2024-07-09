//
//  AddPlaceFormView.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import PhotosUI
import SwiftUI

struct AddPlaceFormView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: PlaceListViewModel
    
    @State var titleText: String = ""
    @State var descriptionText: String = ""
    @State var image: Image? = nil
    @State var imageItem: PhotosPickerItem? = nil
    
    var body: some View {
        ScrollView {
            VStack (spacing: 16) {
                BaseTextField(label: "Nome do local", text: $titleText)
                BaseTextField(label: "Descrição", text: $descriptionText)
                PhotosPicker("Adicionar imagem", selection: $imageItem, matching: .images)
                    .onChange(of: imageItem, onImageChange)
                image?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Spacer()
                BaseButton("Salvar", action: addPalce)
                    .disabled(isFormInvalid())
            }
            .padding(16)
        }
        .navigationTitle("Próxima parada")
    }
    
    func isFormInvalid() -> Bool {
        return titleText.isEmpty || titleText.count < 3 || descriptionText.isEmpty || descriptionText.count < 5
    }
    
    func addPalce() {
        viewModel.addPlace(title: titleText, description: descriptionText)
        presentationMode.wrappedValue.dismiss()
    }
    
    func onImageChange() {
        Task {
            if let loaded = try? await imageItem?.loadTransferable(type: Image.self) {
                image = loaded
            } else {
                print("Failed")
            }
        }
    }
}

#Preview {
    NavigationView {
        AddPlaceFormView()
            .environmentObject(PlaceListViewModelFactory.createForPreview())
    }
}
