//
//  Categories.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import Foundation

struct Categories {
    static let categories = [NewsCategoryModel(id: 1, name: "главное", icon: "top news", endpoint: .general, articlesCount: 0, sound: "newspaper.mp3"), NewsCategoryModel(id: 2, name: "технологии", icon: "technology", endpoint: .technology, articlesCount: 0, sound: "technology.wav"), NewsCategoryModel(id: 3, name: "спорт", icon: "sport", endpoint: .sport, articlesCount: 0, sound: "sport.wav"), NewsCategoryModel(id: 4, name: "бизнес", icon: "business", endpoint: .business, articlesCount: 0, sound: "business.mp3"), NewsCategoryModel(id: 5, name: "развлечения", icon: "entertainment", endpoint: .entertainment, articlesCount: 0, sound: "entertainment.mp3")]
}
