//
//  DishesAppApp.swift
//  DishesApp
//
//  Created by Magina Marina on 30.06.2023.
//

import SwiftUI

@main
struct DishesAppApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(DependenciesFactory.createCartViewModel())
                .environmentObject(DependenciesFactory.createStatusViewModel())
                .environmentObject(DependenciesFactory.createMainViewModel())
        }
    }
}
