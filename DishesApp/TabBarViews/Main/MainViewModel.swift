//
//  MainViewModel.swift
//  DishesApp
//
//  Created by Magina Marina on 02.07.2023.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var categories: [DishCategory] = []
    let manager: DishCategoriesManagerProtocol
    
    init(manager: DishCategoriesManagerProtocol) {
        self.manager = manager
    }
    
    func onFirstAppear() {
        Task { [weak self] in
            guard let self = self else {
                return
            }
            let categories = await manager.fetchDishCategories()
            await MainActor.run {
                self.categories = categories ?? []
            }
            
        }
    }
}
