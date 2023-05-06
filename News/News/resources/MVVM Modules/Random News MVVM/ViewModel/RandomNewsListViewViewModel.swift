//
//  RandomNewsListViewViewModel.swift
//  News
//
//  Created by Марк Киричко on 06.05.2023.
//

import Foundation

class RandomNewsListViewViewModel: ObservableObject {
    
    @Published var news = [Article]()
    @Published var title = "Рандом"
    
    // MARK: - сервисы
    private let randomManager = RandomManager()
    private let newsService = NewsService()
    private let player = AudioPlayer()
    
    // MARK: - генерация случайных статей
    func GenerateRandomNews() {
        let category = randomManager.ReturnRandomElement(array: Categories.categories) as! NewsCategoryModel
        title = category.name
        player.PlaySound(resource: category.sound)
        newsService.execute(with: News.self, category: category.endpoint) { [weak self] result in
            switch result {
            case .success(let data):
                guard let news = data.articles else {return}
                self?.news = news
            case .failure(let error):
                print(error)
            }
        }
    }
}
