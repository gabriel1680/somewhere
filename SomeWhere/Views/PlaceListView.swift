//
//  CardListView.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import SwiftUI

struct PlaceListView: View {
    
    @State var items: [PlaceModel] = [
        PlaceModel(title: "First Title", description: "desc"),
        PlaceModel(title: "Second Title", description: "desc"),
        PlaceModel(title: "Third Title", description: "desc"),
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                PlaceCardView(place: item)
            }
        }
        .navigationTitle("Locais")
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
}

