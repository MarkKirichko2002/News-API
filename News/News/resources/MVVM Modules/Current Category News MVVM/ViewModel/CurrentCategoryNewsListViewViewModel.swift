//
//  CurrentCategoryNewsListViewViewModel.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import Foundation

class CurrentCategoryNewsListViewViewModel: ObservableObject {
    
    @Published var news = [Article]()
    private let newsService = NewsService()
    private let player = AudioPlayer()
        
    func GetCurrentCategoryNews(endpoint: NewsCategory) {
        newsService.execute(with: News.self, category: endpoint) { [weak self] result in
            switch result {
            case .success(let data):
                guard let news = data.articles else {return}
                self?.news = news
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func PlayCurrentNewsCategorySound(sound: String) {
        player.PlaySound(resource: sound)
    }
}
