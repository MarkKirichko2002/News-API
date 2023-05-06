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
            RoundedImageView(image: article.urlToImage ?? "https://media.istockphoto.com/id/1175387759/vector/camera-icon.jpg?s=612x612&w=0&k=20&c=paC1ZkU31dH2B5epXqT_cYOyca5uqh4v0WpFUldCUBE=", width: 90, height: 90, color: .black, lineWidth: 5, isURL: true)
            VStack(alignment: .leading) {
                Text(article.title)
                    .fontWeight(.black)
                    .lineLimit(7)
                Text(article.description ?? "")
                    .fontWeight(.medium)
                    .lineLimit(2)
            }
        }
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell(article: Article(id: "id", source: .init(name: "source"), author: "author", title: "title", description: "description", url: "url", urlToImage: "urlToImage", publishedAt: "publishedAt", content: "content"))
    }
}
