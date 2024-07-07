//
//  PlaceViewModelFactory.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import Foundation

struct PlaceListViewModelFactory {
    public static func createForPreview() -> PlaceListViewModel {
        return PlaceListViewModel(MemoryPlaceRepository())
    }
}
