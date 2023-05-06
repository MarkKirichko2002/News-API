//
//  News.swift
//  News
//
//  Created by Марк Киричко on 06.05.2023.
//

import Foundation

// MARK: - News
struct News: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}
