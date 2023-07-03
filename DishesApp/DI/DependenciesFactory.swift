//
//  DependenciesFactory.swift
//  DishesApp
//
//  Created by Magina Marina on 02.07.2023.
//

import Foundation

final class DependenciesFactory {
    static func createMainViewModel() -> MainViewModel {
        return MainViewModel(manager: DishCategoriesManager())
    }
    
    static func createCategoryDetailsViewModel(for category: DishCategory) -> CategoryDetailsViewModel {
        return CategoryDetailsViewModel(manager: CategoryDetailsManager(), category: category)
    }
    
    static func createCartViewModel() -> CartViewModel {
        CartViewModel()
    }
    
    static func createStatusViewModel() -> StatusViewModel {
        StatusViewModel(locationManager: LocationManager())
    }
}
