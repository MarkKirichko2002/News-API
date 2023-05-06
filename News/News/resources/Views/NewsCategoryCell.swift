//
//  NewsCategoryCell.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import SwiftUI

struct NewsCategoryCell: View {
    
    var category: NewsCategoryModel
    
    var body: some View {
        HStack(spacing: 15) {
            Image(category.icon)
                .resizable()
                .frame(width: 80, height: 80)
            VStack(alignment: .leading, spacing: 10) {
                Text(category.name)
                    .fontWeight(.black)
                Text("статей: \(category.articlesCount)")
                    .fontWeight(.black)
            }
        }
    }
}
