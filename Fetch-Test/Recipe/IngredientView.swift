//
//  IngredientView.swift
//  Fetch-Test
//
//  Created by James Casey on 9/4/24.
//

import SwiftUI

struct IngredientView: View {
    let text: String
    
    var body: some View {
        if !text.isEmpty {
            Text(text)
        }
    }
}

#Preview {
    IngredientView(text: "")
}
