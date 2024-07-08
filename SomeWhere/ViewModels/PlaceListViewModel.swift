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
        executeInBackground("fetch places", {
            self.items = try await self.repository.fetch()
        })
    }
    
    public func removeItem(_ indexSet: IndexSet) {
        print("called < vm.removeItem()")
        guard let idx = indexSet.first else { return }
        let model = items[idx]
        items.remove(atOffsets: indexSet)
        executeInBackground("remove place", {
            try await self.repository.remove(model)
        })
    }
    
    public func addPlace(title: String, description: String) {
        let model: PlaceModel = PlaceModel(title, description)
        items.append(model)
        executeInBackground("save place", {
            try await self.repository.save(model)
        })
    }
    
    public func updatePlace(_ id: String, _ title: String, _ description: String) {
        guard let idx = items.firstIndex(where: { $0.id.elementsEqual(id) }) else { return }
        let model = items[idx]
        items[idx] = model.update(title, description)
        executeInBackground("update place", {
            try await self.repository.update(self.items[idx])
        })
    }
    
    private func executeInBackground(_ opName: String, _ action: @escaping () async throws -> Void) {
        Task {
            do {
                try await action()
            } catch {
                print("ERROR: Failed to \(opName): \(error)")
            }
        }
    }
}
