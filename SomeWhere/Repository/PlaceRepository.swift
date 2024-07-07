//
//  PlaceService.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import Foundation

protocol PlaceRepository {
    func fetch() async throws -> [PlaceModel]
    func save(_ place: PlaceModel) async throws
    func remove(_ place: PlaceModel) async throws
}
