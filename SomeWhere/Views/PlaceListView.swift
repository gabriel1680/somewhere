//
//  CardListView.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import SwiftUI

struct PlaceListView: View {
    
    @EnvironmentObject var viewModel: PlaceListViewModel
    
    var body: some View {
        ZStack {
            if viewModel.items.isEmpty {
                EmptyPlaceListView()
            } else {
                FilledPlaceListView(viewModel)
            }
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("Lista de desejos ✨")
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                NavigationLink(destination: AddPlaceFormView(), label: {
                    Image(systemName: "plus")
                })
            }
        }
        .onAppear() {
            Task {
                await viewModel.fetchPlaces()
            }
        }
    }

}

#Preview {
    NavigationView {
        PlaceListView()
    }
    .environmentObject(PlaceListViewModelFactory.createForPreview())
}


struct FilledPlaceListView: View {
    
    private var viewModel: PlaceListViewModel
    
    init(_ viewModel: PlaceListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(viewModel.items) { item in
                NavigationLink(destination: PlaceDetailsView(place: item), label: {
                    PlaceCardView(place: item)
                })
                .listRowSeparator(.hidden)
            }
            .onDelete(perform: remove)
            .listRowBackground(Color.white)
        }
    }
    
    func remove(indexSet: IndexSet) {
        Task {
            await viewModel.removeItem(indexSet)
        }
    }
}

struct EmptyPlaceListView: View {
    var body: some View {
        VStack {
            Text("Parece você não tem nenhum para ir 😢")
            NavigationLink(destination: AddPlaceFormView(), label: {
                Text("Adicionar próxima parada")
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
