//
//  Categories.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import Foundation

struct Categories {
    static let categories = [NewsCategoryModel(id: 1, name: "Главное", icon: "flame", sound: "newspaper.mp3", endpoint: .general, articlesCount: 0, voiceCommand: "главн"), NewsCategoryModel(id: 2, name: "Технологии", icon: "desktopcomputer", sound: "technology.wav", endpoint: .technology, articlesCount: 0, voiceCommand: "техно"), NewsCategoryModel(id: 3, name: "Спорт", icon: "basketball.fill", sound: "sport.wav", endpoint: .sport, articlesCount: 0, voiceCommand: "спорт"), NewsCategoryModel(id: 4, name: "Бизнес", icon: "briefcase", sound: "business.mp3", endpoint: .business, articlesCount: 0, voiceCommand: "бизнес"), NewsCategoryModel(id: 5, name: "Наука", icon: "bolt", sound: "science.mp3", endpoint: .science, articlesCount: 0, voiceCommand: "наук"), NewsCategoryModel(id: 6, name: "Развлечения", icon: "film", sound: "entertainment.mp3", endpoint: .entertainment, articlesCount: 0, voiceCommand: "развлеч"), NewsCategoryModel(id: 7, name: "Здоровье", icon: "stethoscope", sound: "", endpoint: .health, articlesCount: 0, voiceCommand: "здоров")]
}
