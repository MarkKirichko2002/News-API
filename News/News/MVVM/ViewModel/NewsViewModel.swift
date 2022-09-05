//
//  NewsViewModel.swift
//  News
//
//  Created by Марк Киричко on 13.07.2022.
//

import AVFoundation
import Alamofire
import Speech
import Combine

class NewsViewModel: ObservableObject {
    
    @Published var news = [Article]()
    @Published var text = "Поиск"
    @Published var isStart : Bool = false
    var url = "https://newsapi.org/v2/top-headlines?country=ru&apiKey=apiKey"
    let audioEngine = AVAudioEngine()
    let speechReconizer = SFSpeechRecognizer(locale: Locale.init(identifier: "ru-RU"))
    let request = SFSpeechAudioBufferRecognitionRequest()
    var task : SFSpeechRecognitionTask!
    var cancellation: AnyCancellable?
    
    func Speak(word: String) {
        let utterance = AVSpeechUtterance(string: word)
        utterance.voice = AVSpeechSynthesisVoice(language: "ru-RU")
        utterance.rate = 0.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    func startSpeechRecognization(){
        
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
            self.request.append(buffer)
        }
        
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch let error {
            print("Error comes here for starting the audio listner =\(error.localizedDescription)")
        }
        
        guard let myRecognization = SFSpeechRecognizer() else {
            print("Recognization is not allow on your local")
            return
        }
        
        if !myRecognization.isAvailable {
            print("Recognization is free right now, Please try again after some time.")
        }
        
        task = speechReconizer?.recognitionTask(with: request, resultHandler: { (response, error) in
            guard let response = response else {
                if error != nil {
                    print(error.debugDescription)
                } else {
                    print("Problem in giving the response")
                }
                return
            }
            
            let message = response.bestTranscription.formattedString
            print("Message : \(message)")
            self.text = message
            
            
            var lastString: String = ""
            for segment in response.bestTranscription.segments {
                let indexTo = message.index(message.startIndex, offsetBy: segment.substringRange.location)
                lastString = String(message[indexTo...])
                self.text = String(message[indexTo...])
            }
            
            if lastString.contains("Главн") || lastString.contains("главн") {
                self.url = "https://newsapi.org/v2/top-headlines?country=ru&category=general&apiKey=apiKey"
                self.text = "Главное"
            }
            
            if lastString.contains("Техно") || lastString.contains("техно") {
                self.url = "https://newsapi.org/v2/top-headlines?country=ru&category=technology&apiKey=apiKey"
                self.text = "Технологии"
            }
            
            if lastString.contains("Спорт") || lastString.contains("спорт") {
                self.url = "https://newsapi.org/v2/top-headlines?country=ru&category=sport&apiKey=apiKey"
                self.text = "Спорт"
            }
            
            if lastString.contains("Бизнес") || lastString.contains("бизнес") {
                self.url = "https://newsapi.org/v2/top-headlines?country=ru&category=business&apiKey=apiKey"
                self.text = "Бизнес"
            }
            
            if lastString.contains("Развлеч") || lastString.contains("развлеч") {
                self.url = "https://newsapi.org/v2/top-headlines?country=ru&category=entertainment&apiKey=apiKey"
                self.text = "Развлечения"
            }
            
            if lastString == "Сортировка" || lastString == "cортировка" {
                self.text = "↕️"
                self.news.shuffle()
            }
            
            if lastString.contains("Сколько") || lastString.contains("сколько") {
                self.text = "Всего статей: \(self.news.count)"
            }
        })
    }
    
    
    func cancelSpeechRecognization() {
        task.finish()
        task.cancel()
        task = nil
        
        request.endAudio()
        audioEngine.stop()
        
        if audioEngine.inputNode.numberOfInputs > 0 {
            audioEngine.inputNode.removeTap(onBus: 0)
        }
    }
    
    func CurrentCategory(category: NewsCategory) {
        switch category.id {
            
        case 1:
            url = "https://newsapi.org/v2/top-headlines?country=ru&category=general&apiKey=apiKey"
            
        case 2:
            url = "https://newsapi.org/v2/top-headlines?country=ru&category=technology&apiKey=apiKey"
            
        case 3:
            url = "https://newsapi.org/v2/top-headlines?country=ru&category=sport&apiKey=apiKey"
            
        case 4:
            url = "https://newsapi.org/v2/top-headlines?country=ru&category=business&apiKey=apiKey"
           
        case 5:
            url = "https://newsapi.org/v2/top-headlines?country=ru&category=entertainment&apiKey=apiKey"
            
        default: break
        }
    }
    
    func RandomCategory() {
        let urls = ["https://newsapi.org/v2/top-headlines?country=ru&category=general&apiKey=apiKey", "https://newsapi.org/v2/top-headlines?country=ru&category=technology&apiKey=apiKey", "https://newsapi.org/v2/top-headlines?country=ru&category=sport&apiKey=apiKey","https://newsapi.org/v2/top-headlines?country=ru&category=business&apiKey=apiKey", "https://newsapi.org/v2/top-headlines?country=ru&category=entertainment&apiKey=apiKey"]
        
        self.url = urls.randomElement() ?? ""
        
        switch url {
            
        case "https://newsapi.org/v2/top-headlines?country=ru&category=general&apiKey=apiKey":
            text = "Главное"
            
        case "https://newsapi.org/v2/top-headlines?country=ru&category=technology&apiKey=apiKey":
            text = "Технологии"
            
        case "https://newsapi.org/v2/top-headlines?country=ru&category=sport&apiKey=apiKey":
            text = "Спорт"
            
        case "https://newsapi.org/v2/top-headlines?country=ru&category=business&apiKey=apiKey":
            text = "Бизнес"
        
        case
            "https://newsapi.org/v2/top-headlines?country=ru&category=entertainment&apiKey=apiKey":
            text = "Развлечения"
            
        default: break
            
        }
        
    }
    
    func fetch() -> AnyPublisher<News, AFError> {
        let publisher = AF.request(url).publishDecodable(type: News.self)
        return publisher.value()
    }
    
    func GetNews() {
        cancellation = fetch()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { news in
                self.news = news.articles ?? self.news
            })
     }
    
}

