//
//  SomeWhereApp.swift
//  SomeWhere
//
//  Created by Gabriel Lopes on 06/07/24.
//

import SwiftUI

@main
struct SomeWhereApp: App {
    
    @StateObject var placeListViewModel = PlaceListViewModelFactory.createForPreview()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                PlaceListView()
            }
        }
        .environmentObject(placeListViewModel)
    }
}


