//
//  PlaceListViewModel.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import Foundation

class PlaceListViewModel: ObservableObject {
    
    @Published var items: [PlaceModel] = []
    
    init() {
        items.append(contentsOf: getItems())
    }
    
    func getItems() -> [PlaceModel] {
        return [
            PlaceModel(title: "First Title", description: "Description 1"),
            PlaceModel(title: "Second Title", description: "Lorem Ipsum"),
            PlaceModel(title: "Third Title", description: "Description 6")
        ]
    }
    
    func removeItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func addPlace(title: String, description: String) {
        items.append(PlaceModel(title: title, description: description))
    }
}
