//
//  DishCategoryManager.swift
//  DishesApp
//
//  Created by Magina Marina on 01.07.2023.
//

import Foundation

protocol DishCategoriesManagerProtocol {
    func fetchDishCategories() async -> [DishCategory]?
}

final class DishCategoriesManager: DishCategoriesManagerProtocol {
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
    
    func fetchDishCategories() async -> [DishCategory]? {
        let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54")!
        var result: [DishCategory]?
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try jsonDecoder.decode(DishCategoriesResponse.self, from: data)
            result = response.categories
        } catch {
            print(error)
        }
        
        return result
    }
}
