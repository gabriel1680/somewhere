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
        List {
            ForEach(viewModel.items) { item in
                PlaceCardView(place: item)
                    .listRowSeparator(.hidden)
            }
            .onDelete(perform: viewModel.removeItem)
            .listRowBackground(Color.white)
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
    }

}

#Preview {
    NavigationView {
        PlaceListView()
    }
    .environmentObject(PlaceListViewModel())
}

