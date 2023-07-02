//
//  SearchNewsListViewViewModel.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import SwiftUI

class SearchNewsListViewViewModel: ObservableObject {
    
    @Published var news = [Article]()
    @Published var searchText = ""
    @Published var title = "Поиск"
    @Published var selectedNewsCategory = Categories.categories[0]
    
    // MARK: - сервисы
    private let speechRecognitionManager = SpeechRecognitionManager()
    private let newsService = NewsService()
    private let player = AudioPlayer()
    private let settingsManager = SettingsManager()
    
    // MARK: - Init
    init() {
        GetNews(category: Categories.categories[0])
    }
    
    // MARK: - распознавание речи
    func RecognizeNewsCategories() {
        if settingsManager.isMicrophoneOn {
            StartRecognizeNewsCategory()
        } else {
            StopRecognizeNewsCategory()
        }
    }
    
    func StartRecognizeNewsCategory() {
        speechRecognitionManager.startRecognize()
        speechRecognitionManager.registerSpeechRecognitionHandler { text in
            self.GetSearchNews(text: text)
        }
    }
    
    func StopRecognizeNewsCategory() {
        speechRecognitionManager.cancelSpeechRecognition()
    }
    
    // MARK: - API запросы
    func GetNews(category: NewsCategoryModel) {
        newsService.execute(with: News.self, category: category.endpoint) { [weak self] result in
            switch result {
            case .success(let data):
                guard let news = data.articles else {return}
                DispatchQueue.main.async {
                    self?.selectedNewsCategory = category
                    self?.news = news
                    self?.title = "\(category.name): \(news.count)"
                    if self?.settingsManager.checkInteractiveSetting() ?? false {
                        self?.player.PlaySound(resource: category.sound)
                    } else {
                        print(self?.settingsManager.checkInteractiveSetting())
                    }
                }
            case .failure(let error):
                print(error)
                self?.title = "Ошибка"
            }
        }
    }
    
    // MARK: - поиск новостей
    private func GetSearchNews(text: String) {
        for category in Categories.categories {
            if text.lowercased().contains(category.voiceCommand) {
                selectedNewsCategory = category
                GetNews(category: category)
            }
        }
        speechRecognitionManager.cancelSpeechRecognition()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.speechRecognitionManager.startRecognize()
        }
    }
    
    func SearchNews()-> [Article] {
        if searchText.isEmpty {
            return news
        } else {
            return news.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    // MARK: - воспроизведение аудио
    func PlayCategorySound() {
        if settingsManager.checkInteractiveSetting() {
            player.PlaySound(resource: selectedNewsCategory.sound)
        } else {
            print(settingsManager.checkInteractiveSetting())
        }
    }
}
