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
            Image("morning-workout")
                .resizable()
                .frame(width: 100, height: 100)
            Text(place.title)
            HStack {
                Text(place.description)
                Spacer()
            }
        }
    }
}

#Preview {
    Group {
        PlaceCardView(place: PlaceModel(title: "Title 1",  description: "description"))
        PlaceCardView(place: PlaceModel(title: "Title 2",  description: "description 2"))
    }
    .previewLayout(.sizeThatFits)
}
