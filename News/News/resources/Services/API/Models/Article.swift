//
//  Article.swift
//  News
//
//  Created by Марк Киричко on 13.07.2022.
//

import Foundation

// MARK: - Article
struct Article: Codable {
    let title, author, publishedDate: String
    let publishedDatePrecision: String
    let link: String
    let cleanURL, excerpt, summary, rights: String?
    let rank: Int
    let topic: String
    let country: String
    let language: String?
    let authors: String
    let media: String
    let isOpinion: Bool
    let twitterAccount: String?
    let id: String

    enum CodingKeys: String, CodingKey {
        case title, author
        case publishedDate = "published_date"
        case publishedDatePrecision = "published_date_precision"
        case link
        case cleanURL = "clean_url"
        case excerpt, summary, rights, rank, topic, country, language, authors, media
        case isOpinion = "is_opinion"
        case twitterAccount = "twitter_account"
        case id = "_id"
    }
}
