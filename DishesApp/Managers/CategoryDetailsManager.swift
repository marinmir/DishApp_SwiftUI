//
//  CategoryDetailsManager.swift
//  DishesApp
//
//  Created by Magina Marina on 01.07.2023.
//

import Foundation

protocol CategoryDetailsManagerProtocol {
    func fetchDishes(for categoryId: Int) async -> [Dish]?
}

final class CategoryDetailsManager: CategoryDetailsManagerProtocol {
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
    
    func fetchDishes(for categoryId: Int) async -> [Dish]? {
        let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b")!
        var result: [Dish]?
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try jsonDecoder.decode(CategoryDetailsResponse.self, from: data)
            result = response.dishes
        } catch {
            print(error)
        }
        
        return result
    }
}
