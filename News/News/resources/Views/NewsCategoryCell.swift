//
//  NewsCategoryCell.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import SwiftUI

struct NewsCategoryCell: View {
    
    var category: NewsCategoryModel
    private let player = AudioPlayer()
    
    var body: some View {
        HStack(spacing: 15) {
            SpringImageView(image: category.icon, width: 60, height: 60) {
                player.PlaySound(resource: category.sound)
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(category.name)
                    .fontWeight(.black)
                Text("статей: \(category.articlesCount)")
                    .fontWeight(.black)
            }
        }
    }
}
