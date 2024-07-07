//
//  PlaceListViewModel.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import Foundation

class PlaceListViewModel: ObservableObject {
    
    @Published public var items = [PlaceModel]()
    
    private let service: PlaceRepository
    
    init(_ repository: PlaceRepository) {
        self.service = repository
    }
    
    public func fetchPlaces() async {
        do {
            items = try await self.service.fetch()
        } catch {
            print("ERROR: Failed to fetch places with error: \(error)")
        }
    }
    
    public func removeItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    public func addPlace(title: String, description: String) {
        items.append(PlaceModel(title: title, description: description))
    }
}
