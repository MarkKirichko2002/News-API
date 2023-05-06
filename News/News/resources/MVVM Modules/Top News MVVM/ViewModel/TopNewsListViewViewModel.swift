//
//  TopNewsListViewViewModel.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import Foundation

class TopNewsListViewViewModel: ObservableObject {
    
    @Published var news = [Article]()
    private let newsService = NewsService()
    
    init() {
        GetTopNews()
    }
    
    func GetTopNews() {
        newsService.execute(with: News.self, category: .general) { result in
            switch result {
            case .success(let data):
                guard let news = data.articles else {return}
                self.news = news
            case .failure(let error):
                print(error)
            }
        }
    }
}
