//
//  NewsCategoriesListViewViewModel.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import Foundation

class NewsCategoriesListViewViewModel: ObservableObject {
    
    private let newsService = NewsService()
    
    @Published var categories = Categories.categories
    
    init() {
        GetNewsCategoriesInfo()
    }
    
    func GetNewsCategoriesInfo() {
        for category in categories {
            newsService.execute(with: News.self, category: category.endpoint) { result in
                switch result {
                case .success(let data):
                    guard let news = data.articles?.count else {return}
                    self.categories[category.id - 1].articlesCount = news
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
