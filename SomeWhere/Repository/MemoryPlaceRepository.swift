//
//  MemoryPlaceRepository.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import Foundation

struct MemoryPlaceRepository: PlaceRepository {
    
    func save(_ place: PlaceModel) async throws {
    }
    
    func remove(_ place: PlaceModel) async throws {
    }
    
    func fetch() async throws -> [PlaceModel] {
        return PlaceDataMock.places
    }
}
