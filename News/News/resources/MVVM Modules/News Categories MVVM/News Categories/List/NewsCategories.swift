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
        NewsCategoryModel(id: 2, name: "Спорт", icon: "sport", sound: "sport.wav", endpoint: .sport, articlesCount: 0, voiceCommand: "главн"),
        NewsCategoryModel(id: 3, name: "Технологии", icon: "technology", sound: "technology.wav", endpoint: .tech, articlesCount: 0, voiceCommand: "техно"),
        NewsCategoryModel(id: 4, name: "Мир", icon: "world", sound: "sport.wav", endpoint: .world, articlesCount: 0, voiceCommand: "мир"),
        NewsCategoryModel(id: 5, name: "Финансы", icon: "finance", sound: "business.mp3", endpoint: .finance, articlesCount: 0, voiceCommand: "финанс"),
        NewsCategoryModel(id: 6, name: "Бизнес", icon: "business", sound: "business.mp3", endpoint: .finance, articlesCount: 0, voiceCommand: "бизнес"),
        NewsCategoryModel(id: 7, name: "Экономика", icon: "economics", sound: "business.mp3", endpoint: .finance, articlesCount: 0, voiceCommand: "эконом"),
        NewsCategoryModel(id: 8, name: "Развлечения", icon: "entertainment", sound: "entertainment.mp3", endpoint: .entertainment, articlesCount: 0, voiceCommand: "развлеч"),
        NewsCategoryModel(id: 9, name: "Путешествия", icon: "travel", sound: "business.mp3", endpoint: .entertainment, articlesCount: 0, voiceCommand: "путешестви"),
        NewsCategoryModel(id: 10, name: "Музыка", icon: "music", sound: "business.mp3", endpoint: .music, articlesCount: 0, voiceCommand: "муз"),
        NewsCategoryModel(id: 11, name: "Еда", icon: "food", sound: "business.mp3", endpoint: .food, articlesCount: 0, voiceCommand: "ед"),
        NewsCategoryModel(id: 12, name: "Наука", icon: "science", sound: "science.mp3", endpoint: .science, articlesCount: 0, voiceCommand: "наук"),
        NewsCategoryModel(id: 13, name: "Игры", icon: "games", sound: "science.mp3", endpoint: .gaming, articlesCount: 0, voiceCommand: "игр"),
        NewsCategoryModel(id: 14, name: "Энергия", icon: "energy", sound: "science.mp3", endpoint: .energy, articlesCount: 0, voiceCommand: "энерги"),
    ]
}
