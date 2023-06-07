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
    @Published var CategoryIcon = "random"
    @Published var CategorySound = ""
    @AppStorage("isInteractiveOn") var isInteractiveOn = false
    
    // MARK: - сервисы
    private let randomManager = RandomManager()
    private let newsService = NewsService()
    private let player = AudioPlayer()
    
    // MARK: - генерация случайных статей
    func GenerateRandomNews() {
        let category = randomManager.ReturnRandomElement(array: Categories.categories) as! NewsCategoryModel
        title = category.name
        if isInteractiveOn {
            player.PlaySound(resource: category.sound)
        } else {
            print(isInteractiveOn)
        }
        CategoryIcon = category.icon
        CategorySound = category.sound
        newsService.execute(with: News.self, category: category.endpoint) { [weak self] result in
            switch result {
            case .success(let data):
                guard let news = data.articles else {return}
                DispatchQueue.main.async {
                    self?.news = news
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func PlayCategorySound() {
        player.PlaySound(resource: CategorySound)
    }
}
