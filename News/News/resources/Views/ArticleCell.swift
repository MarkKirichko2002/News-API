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
            RoundedImageView(image: article.urlToImage ?? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg", width: 100, height: 100, color: .black, lineWidth: 5, sound: "newspaper.mp3", isURL: true)
            VStack(alignment: .leading) {
                Text(article.title)
                    .fontWeight(.black)
                    .lineLimit(7)
                Text(article.publishedAt)
                    .fontWeight(.medium)
                    .lineLimit(2)
            }
        }
    }
}
