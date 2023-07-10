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
    let totalHits, page, totalPages, pageSize: Int?
    let articles: [Article]?

    enum CodingKeys: String, CodingKey {
        case status
        case totalHits = "total_hits"
        case page
        case totalPages = "total_pages"
        case pageSize = "page_size"
        case articles
    }
}
