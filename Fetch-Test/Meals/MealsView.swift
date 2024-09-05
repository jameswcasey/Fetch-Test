//
//  MealsView.swift
//  Fetch-Test
//
//  Created by James Casey on 9/4/24.
//

import SwiftUI

struct MealsView: View {
    @StateObject private var viewModel = MealsViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.meals) { meal in
                    NavigationLink {
                        RecipeView(mealID: meal.idMeal)
                    } label: {
                        MealViewCell(meal: meal)
                    }
                }
            }
            .listStyle(.plain)
            .task {
                await viewModel.fetchMeals()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Desserts").font(.title)
                }
            }
        }
    }
}

#Preview {
    MealsView()
}
