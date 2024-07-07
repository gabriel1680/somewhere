//
//  PlaceListViewModel.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import Foundation

@Observable
class PlaceListViewModel: ObservableObject {
    
    @ObservationIgnored
    private let repository: PlaceRepository
    
    public var items = [PlaceModel]()
    
    init(_ repository: PlaceRepository) {
        self.repository = repository
    }
    
    public func fetchPlaces() {
        Task {
            do {
                items = try await self.repository.fetch()
            } catch {
                print("ERROR: Failed to fetch places error: \(error)")
            }
        }
    }
    
    public func removeItem(_ indexSet: IndexSet) {
        guard let idx = indexSet.first else { return }
        let model = items[idx]
        items.remove(atOffsets: indexSet)
        Task {
            do {
                try await repository.remove(model)
            } catch {
                print("ERROR: Failed to remove place error: \(error)")
            }
        }
    }
    
    public func addPlace(title: String, description: String) {
        let model: PlaceModel = PlaceModel(title: title, description: description)
        items.append(model)
        Task {
            do {
                try await repository.save(model)
            } catch {
                print("ERROR: Failed to save place error: \(error)")
            }
        }
    }
    
    public func updatePlace(_ id: String, _ title: String, _ description: String) {
        guard let idx = items.firstIndex(where: { $0.id.elementsEqual(id) }) else { return }
        let model = items[idx]
        items[idx] = model.update(title, description)
        Task {
            do {
                try await repository.update(items[idx])
            } catch {
                print("ERROR: Failed to remove place error: \(error)")
            }
        }
    }
}
