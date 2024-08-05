//
//  News.swift
//  News
//
//  Created by Марк Киричко on 06.05.2023.
//

import Foundation

// MARK: - News
struct News: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Identifiable, Codable {
    let id = UUID()
    let author, title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}
