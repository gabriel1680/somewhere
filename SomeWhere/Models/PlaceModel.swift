//
//  PlaceModel.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import Foundation

struct PlaceModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let description: String
}
