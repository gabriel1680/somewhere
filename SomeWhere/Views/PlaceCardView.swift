//
//  CardListRowView.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import SwiftUI

struct PlaceCardView: View {
    
    let place: PlaceModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(place.image ?? "card-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                VStack {
                    Text(place.title)
                    Text(place.description)
                }
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(.gray))
                .shadow(radius: 0.5)
        )
        .padding([.top, .horizontal])
    }
}

#Preview {
    Group {
        PlaceCardView(place: PlaceModel(title: "Title 1",  description: "description"))
        PlaceCardView(place: PlaceModel(title: "Title 2",  description: "description 2"))
    }
    .previewLayout(.sizeThatFits)
}
