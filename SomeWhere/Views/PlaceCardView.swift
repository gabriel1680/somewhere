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
                VStack(alignment: .leading) {
                    Text(place.title)
                    Text(place.description)
                }
                .padding([.bottom, .leading])
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(.gray))
        )
        .padding(.top)
    }
}

#Preview {
    Group {
        PlaceCardView(place: PlaceDataMock.places[0])
    }
    .previewLayout(.sizeThatFits)
    .padding()
}
