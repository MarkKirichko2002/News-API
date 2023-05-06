//
//  Article.swift
//  News
//
//  Created by Марк Киричко on 13.07.2022.
//

import Foundation

// MARK: - Article
struct Article: Identifiable, Codable {
    var id: String?
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

