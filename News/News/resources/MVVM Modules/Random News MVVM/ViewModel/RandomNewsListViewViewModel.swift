//
//  RandomNewsListViewViewModel.swift
//  News
//
//  Created by Марк Киричко on 06.05.2023.
//

import SwiftUI

class RandomNewsListViewViewModel: ObservableObject {
    
    @Published var news = [Article]()
    @Published var title = "Рандом"
    @Published var randomCategory = NewsCategories.categoriesList[0]
    @AppStorage("isInteractiveOn") var isInteractiveOn = false
    @AppStorage("isShakeToGenerateOn") var isShakeToGenerateOn = false
    
    // MARK: - сервисы
    private let randomManager = RandomManager()
    private let newsService = NewsService()
    private let player = AudioPlayer()
    
    // MARK: - генерация случайных статей
    func GenerateRandomNews() {
        let category = randomManager.ReturnRandomElement(array: NewsCategories.categoriesList) as! NewsCategoryModel
        title = category.name
        if isInteractiveOn {
            player.PlaySound(resource: category.sound)
        } else {
            print(isInteractiveOn)
        }
        newsService.execute(with: News.self, category: category.endpoint) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.news = data.articles
                    self?.randomCategory = category
                    self?.randomCategory.articlesCount = self?.news.count ?? 0
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func PlayCategorySound() {
        player.PlaySound(resource: randomCategory.sound)
    }
}
