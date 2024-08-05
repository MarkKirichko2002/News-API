//
//  NewsCategories.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import Foundation

struct NewsCategories {
    static let categoriesList = [
        NewsCategoryModel(id: 1, name: "Главное", icon: "fire", sound: "newspaper.mp3", endpoint: .news, articlesCount: 0, voiceCommand: "главн"),
        NewsCategoryModel(id: 2, name: "Технологии", icon: "technology", sound: "technology.wav", endpoint: .tech, articlesCount: 0, voiceCommand: "техно"),
        NewsCategoryModel(id: 3, name: "Спорт", icon: "sport", sound: "sport.wav", endpoint: .sport, articlesCount: 0, voiceCommand: "спорт"),
        NewsCategoryModel(id: 4, name: "Бизнес", icon: "finance", sound: "business.mp3", endpoint: .business, articlesCount: 0, voiceCommand: "бизнес"),
        NewsCategoryModel(id: 5, name: "Развлечения", icon: "entertainment", sound: "entertainment.mp3", endpoint: .entertainment, articlesCount: 0, voiceCommand: "развлеч"),
        NewsCategoryModel(id: 6, name: "Наука", icon: "science", sound: "science.mp3", endpoint: .science, articlesCount: 0, voiceCommand: "развлеч"),
    ]
}
