//
//  MealsViewModel.swift
//  Fetch-Test
//
//  Created by James Casey on 9/4/24.
//

import Foundation


final class MealsViewModel: ObservableObject {
    
    @MainActor @Published private(set) var meals: [Meal] = []
    
    private let networkManager: Networkable
    
    init(networkManager: Networkable = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    @MainActor
    func fetchMeals() async {
        do {
            meals = try await networkManager.fetchDesserts()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
