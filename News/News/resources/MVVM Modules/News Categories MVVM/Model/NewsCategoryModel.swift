//
//  NewsCategoryModel.swift
//  News
//
//  Created by Марк Киричко on 13.07.2022.
//

import Combine

struct NewsCategoryModel: Identifiable, Hashable {
    
    typealias Output = AnyPublisher
    
    typealias Failure = AnyPublisher
    
    let id: Int
    let name: String
    let icon: String
    let endpoint: NewsCategory
    var articlesCount: Int
    var sound: String
}
