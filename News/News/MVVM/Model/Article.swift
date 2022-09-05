//
//  Article.swift
//  News
//
//  Created by Марк Киричко on 13.07.2022.
//

import Foundation

// MARK: - News
struct News: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Identifiable, Codable {
    var id: String?
    //let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let name: String
}

// MARK: - ArticleResponse
struct ArticleResponse: Codable {
    let status: String
    let totalResults: Int?
    let results: [Result]?
    let nextPage: Int?
}

// MARK: - Result
struct Result: Identifiable, Codable {
    let id = UUID()
    let title: String
    let link: String
    let keywords: [String]?
    //let creator, videoURL: JSONNull?
    let description: String
    let content: String?
    let pubDate: String
    let imageURL: String
    let sourceID: SourceID?
    let country: [Country]
    let category: [Category]
    let language: Language

    enum CodingKeys: String, CodingKey {
        case title, link, keywords
        case description = "description"
        case content, pubDate
        case imageURL = "image_url"
        case sourceID = "source_id"
        case country, category, language
    }
}

enum Category: String, Codable {
    case technology = "technology"
}

enum Country: String, Codable {
    case russia = "russia"
}

enum Language: String, Codable {
    case russian = "russian"
}

enum SourceID: String, Codable {
    case the3Dnews = "3dnews"
}
