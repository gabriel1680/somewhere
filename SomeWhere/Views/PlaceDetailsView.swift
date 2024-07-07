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
                    TextField("\(place.title)", text: $title)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(white: 0.9, opacity: 0.7))
                        .cornerRadius(6)
                }
                VStack(alignment: .leading) {
                    Text("Descrição").bold()
                    TextField("\(place.description)", text: $description)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(white: 0.9, opacity: 0.7))
                        .cornerRadius(6)
                }
                Spacer()
                Button(action: updatePlace, label: {
                    Text("Salvar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .cornerRadius(30)
                })
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
        PlaceDetailsView(place: .init(title: "some where", description: "over the rainbow"))
    }
    .environmentObject(PlaceListViewModelFactory.createForPreview())
}
