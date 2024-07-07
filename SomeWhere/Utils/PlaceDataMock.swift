//
//  PlaceDataMock.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import Foundation

struct PlaceDataMock {
    public static var places: [PlaceModel] = [
        .init(title: "First Title", description: "First massive description of place"),
        .init(title: "Second Title", description: "Second medium description"),
        .init(title: "Third Title", description: "Third tiny desc"),
        .init(title: "Fourth Title", description: "Fourth massive description of place")
    ]
}
