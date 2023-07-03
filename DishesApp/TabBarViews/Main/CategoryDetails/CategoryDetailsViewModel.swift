//
//  CategoryDetailsViewModel.swift
//  DishesApp
//
//  Created by Magina Marina on 02.07.2023.
//

import Foundation

final class CategoryDetailsViewModel: ObservableObject {
    @Published var dishes: [Dish] = []
    @Published var tags: [String] = []
    @Published var categoryName = ""
    @Published var selectedTags: Set<String> = []
    
    private var allDishes: [Dish] = []
    private let manager: CategoryDetailsManagerProtocol
    private let category: DishCategory
    
    init(manager: CategoryDetailsManagerProtocol, category: DishCategory) {
        self.manager = manager
        self.category = category
        self.categoryName = category.name
    }
    
    func onFirstAppear() {
        Task { [weak self] in
            guard let self = self else {
                return
            }
            let dishes = await manager.fetchDishes(for: category.id) ?? []
            
            var tags: Set<String> = []
            for dish in dishes {
                tags.formUnion(dish.tegs)
            }
            
            await MainActor.run { [tags] in
                self.dishes = dishes
                self.allDishes = dishes
                self.tags = Array(tags).sorted()
            }
        }
    }
    
    func onTagTap(_ tag: String) {
        if selectedTags.contains(tag) {
            selectedTags.remove(tag)
        } else {
            selectedTags.insert(tag)
        }
        
        if selectedTags.isEmpty {
            dishes = allDishes
        } else {
            var taggedDishes: [Dish] = []
            for dish in allDishes {
                let dishTags: Set<String> = Set(dish.tegs)
                
                if !selectedTags.intersection(dishTags).isEmpty {
                    taggedDishes.append(dish)
                }
            }
            dishes = taggedDishes
        }
    }
}
