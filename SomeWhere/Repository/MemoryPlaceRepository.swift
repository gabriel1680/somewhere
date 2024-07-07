//
//  MemoryPlaceRepository.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import Foundation

class MemoryPlaceRepository: PlaceRepository {
    
    private var items: [PlaceModel]
    
    init() {
        self.items = PlaceDataMock.places
    }
    
    func save(_ place: PlaceModel) async throws {
        items.append(place)
    }
    
    func remove(_ place: PlaceModel) async throws {
        guard let idx = items.firstIndex(where: { $0.id.elementsEqual(place.id) }) else { return }
        items.remove(at: idx)
    }
    
    func update(_ place: PlaceModel) async throws {
        guard let idx = items.firstIndex(where: { $0.id.elementsEqual(place.id) }) else { return }
        items[idx] = place
    }
    
    func fetch() async throws -> [PlaceModel] {
        return items
    }
}
