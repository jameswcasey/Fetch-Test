//
//  RecipeViewModel.swift
//  Fetch-Test
//
//  Created by James Casey on 9/4/24.
//

import Foundation
import func SwiftUI.withAnimation

final class RecipeViewModel: ObservableObject {
    @MainActor @Published private(set) var recipe: Recipe?
    
    @MainActor @Published private(set) var loading: Bool = true
    
    private let networkManager: Networkable
    
    private let mealID: String
    
    init(mealID: String, networkManager: Networkable = NetworkManager.shared) {
        self.networkManager = networkManager
        self.mealID = mealID
    }
    
    @MainActor
    func fetchRecipe() async {
        do {
            if let dataModel = try await networkManager.lookupRecipe(for: mealID) {
                recipe = Recipe(dataModel: dataModel)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        withAnimation {
            loading = false
        }
    }
}
