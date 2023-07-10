//
//  ArticleCell.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import SwiftUI

struct ArticleCell: View {
    
    var article: Article
    
    var body: some View {
        HStack(spacing: 15) {
            RoundedImageView(image: article.media, width: 100, height: 100, color: .black, lineWidth: 5, sound: "newspaper.mp3", isURL: true)
            VStack(alignment: .leading) {
                Text(article.title)
                    .fontWeight(.black)
                    .lineLimit(7)
                Text(article.publishedDate)
                    .fontWeight(.medium)
                    .lineLimit(2)
            }
        }
    }
}
