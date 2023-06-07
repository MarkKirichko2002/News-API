//
//  SearchNewsListViewViewModel.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import SwiftUI

class SearchNewsListViewViewModel: ObservableObject {
    
    @Published var news = [Article]()
    @Published var filteredNews = [Article]()
    @Published var searchText = ""
    @Published var ButtonImage = "mic"
    @Published var CategoryIcon = "news"
    @Published var CategorySound = "newspaper.mp3"
    @Published var isRecognizing = false
    @Published var title = "Поиск"
    @Published var selectedNewsCategory = Categories.categories[0]
    @AppStorage("isInteractiveOn") var isInteractiveOn = false
    
    // MARK: - сервисы
    private let speechRecognitionManager = SpeechRecognitionManager()
    private let newsService = NewsService()
    private let player = AudioPlayer()
    
    // MARK: - Init
    init() {
        GetNews(category: Categories.categories[0])
    }
    
    // MARK: - распознавание речи
    func RecognizeNewsCategories() {
        isRecognizing = !isRecognizing
        if isRecognizing  {
            StartRecognizeNewsCategory()
            ButtonImage = "mic.fill"
            title = "Поиск..."
        } else {
            StopRecognizeNewsCategory()
            ButtonImage = "mic"
        }
    }
    
    func StartRecognizeNewsCategory() {
        speechRecognitionManager.startSpeechRecognition()
        speechRecognitionManager.registerSpeechRecognitionHandler { text in
            self.GetSearchNews(text: text)
        }
    }
    
    func StopRecognizeNewsCategory() {
        speechRecognitionManager.cancelSpeechRecognization()
    }
    
    // MARK: - API запросы
    func GetNews(category: NewsCategoryModel) {
        newsService.execute(with: News.self, category: category.endpoint) { [weak self] result in
            switch result {
            case .success(let data):
                guard let news = data.articles else {return}
                self?.news = news
                self?.CategoryIcon = category.icon
                self?.title = "\(category.name): \(news.count)"
                if self?.isInteractiveOn ?? false {
                    self?.player.PlaySound(resource: category.sound)
                } else {
                    print(self?.isInteractiveOn)
                }
                self?.CategorySound = category.sound
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
                ButtonImage = "mic"
            }
        }
        speechRecognitionManager.cancelSpeechRecognization()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.speechRecognitionManager.startSpeechRecognition()
            self.ButtonImage = "mic.fill"
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
        if isInteractiveOn {
            player.PlaySound(resource: CategorySound)
        } else {
            print(isInteractiveOn)
        }
    }
}
