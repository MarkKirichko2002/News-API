//
//  NewsCategoryModel.swift
//  News
//
//  Created by Марк Киричко on 13.07.2022.
//

import Combine

struct NewsCategoryModel: Identifiable, Hashable {
    let id: Int
    let name: String
    let icon: String
    let sound: String
    let endpoint: NewsCategory
    var articlesCount: Int
    let voiceCommand: String
}
