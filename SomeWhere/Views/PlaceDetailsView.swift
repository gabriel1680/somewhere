//
//  PlaceDetailsView.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import PhotosUI
import SwiftUI

struct PlaceDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: PlaceListViewModel
    
    @State private var title = ""
    @State private var description = ""
    @State var image: Image? = nil
    @State var imageItem: PhotosPickerItem? = nil
    
    var place: PlaceModel
    
    var body: some View {
        ScrollView {
            Image(place.image ?? "card-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(alignment: .top)
            VStack(alignment: .leading, spacing: 18) {
                VStack(alignment: .leading) {
                    Text("Nome").bold()
                    BaseTextField(label: "\(place.title)", text: $title)
                }
                VStack(alignment: .leading) {
                    Text("Descrição").bold()
                    BaseTextField(label: "\(place.description)", text: $description)
                }
                Spacer()
                BaseButton("Salvar", action: updatePlace)
                    .disabled(isFormInvalid())
            }
        }
        .navigationTitle("Detalhes")
        .padding(.horizontal)
        .onAppear() {
            title = place.title
            description = place.description
        }
    }
    
    private func updatePlace() {
        viewModel.updatePlace(place.id, title, description)
        presentationMode.wrappedValue.dismiss()
    }
    
    private func isFormInvalid() -> Bool {
        return title.isEmpty || description.isEmpty
    }
}

#Preview {
    NavigationStack {
        PlaceDetailsView(place: PlaceDataMock.places[0])
    }
    .environmentObject(PlaceListViewModelFactory.createForPreview())
}
