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
    
    init(title: String, description: String, image: String?) {
        self.id = UUID().uuidString
        self.title = title
        self.description = description
        self.image = image
    }
    
    init(title: String, description: String) {
        self.init(title: title, description: description, image: nil)
    }
}
