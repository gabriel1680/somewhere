//
//  PlaceListViewModel.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import Foundation

class PlaceListViewModel: ObservableObject {
    
    @Published public var items = [PlaceModel]()
    
    private let repository: PlaceRepository
    
    init(_ repository: PlaceRepository) {
        self.repository = repository
    }
    
    public func fetchPlaces() async {
        do {
            items = try await self.repository.fetch()
        } catch {
            print("ERROR: Failed to fetch places error: \(error)")
        }
    }
    
    public func removeItem(_ indexSet: IndexSet) async {
        guard let idx = indexSet.first else { return }
        let model = items[idx]
        items.remove(atOffsets: indexSet)
        do {
            try await repository.remove(model)
        } catch {
            print("ERROR: Failed to remove place error: \(error)")
        }
    }
    
    public func addPlace(title: String, description: String) async {
        let model: PlaceModel = PlaceModel(title: title, description: description)
        items.append(model)
        do {
            try await repository.save(model)
        } catch {
            print("ERROR: Failed to save place error: \(error)")
        }
    }
}
