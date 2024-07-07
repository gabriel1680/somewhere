//
//  MemoryPlaceRepository.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import Foundation

struct MemoryPlaceRepository: PlaceRepository {
    func fetch() async throws -> [PlaceModel] {
        return PlaceDataMock.places
    }
}
