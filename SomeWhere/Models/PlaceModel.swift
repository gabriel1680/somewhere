//
//  PlaceModel.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import Foundation

struct PlaceModel: Identifiable {
    let id: String
    let title: String
    let description: String
    let image: String?
    
    init(_ title: String, _ description: String, _ image: String? = nil) {
        self.init(UUID().uuidString, title, description, image)
    }
    
    init(_ id: String, _ title: String, _ description: String, _ image: String? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
    }
    
    public func update(_ title: String, _ description: String, _ image: String? = nil) -> PlaceModel {
        return PlaceModel(id, title, description, image)
    }
}
