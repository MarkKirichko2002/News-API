//
//  NewsCategoriesListViewViewModel.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import Foundation

class NewsCategoriesListViewViewModel: ObservableObject {
    
    @Published var categories = NewsCategories.categoriesList
    // MARK: - сервисы
    private let newsService = NewsService()
    private let player = AudioPlayer()
    
    init() {
        GetNewsCategoriesInfo()
    }
    
    func GetNewsCategoriesInfo() {
        for category in categories {
            newsService.execute(with: News.self, category: category.endpoint) { [weak self] result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self?.categories[category.id - 1].articlesCount = data.articles.count
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func PlaySound() {
        player.PlaySound(resource: "newspaper.mp3")
    }
}
