//
//  NetworkManager.swift
//  Fetch-Test
//
//  Created by James Casey on 9/4/24.
//

import Foundation


protocol Networkable {
    func fetchDesserts() async throws -> [Meal]
    
    func lookupRecipe(for id: String) async throws -> RecipeDataModel?
}

final class NetworkManager: Networkable {
    
    static let shared: NetworkManager = NetworkManager()
    
    private let baseURL: String = "https://themealdb.com/api/json/v1/1/"
    
    private let urlSession = URLSession.shared
    
    private let jsonDecoder = JSONDecoder()
    
    private init() {}
    
    func fetchDesserts() async throws -> [Meal] {
        let desserts = "filter.php?c=Dessert"
        guard let url = URL(string: baseURL + desserts) else { throw HTTPError.badURL }
        let request = URLRequest(url: url)
        let (data, response) = try await urlSession.data(for: request)
        if validate(response) {
            let meals = try jsonDecoder.decode(Meals.self, from: data)
            return meals.meals.sorted(by: { $0.strMeal < $1.strMeal })
        } else {
            throw HTTPError.networkError
        }
    }
    
    func lookupRecipe(for id: String) async throws -> RecipeDataModel? {
        let lookup = "lookup.php?i=\(id)"
        guard let url = URL(string: baseURL + lookup) else { throw HTTPError.badURL }
        let request = URLRequest(url: url)
        let (data, response) = try await urlSession.data(for: request)
        if validate(response) {
            let recipes = try jsonDecoder.decode(Recipes.self, from: data)
            return recipes.meals.first
        } else {
            throw HTTPError.networkError
        }
    }
    
    private func validate(_ response: URLResponse) -> Bool {
        guard let httpURLResponse = response as? HTTPURLResponse else { return false }
        let statusCode = httpURLResponse.statusCode
        if (200...299).contains(statusCode) {
            return true
        }
        return false
    }
}

enum HTTPError: Error {
    case badURL
    case networkError
}
