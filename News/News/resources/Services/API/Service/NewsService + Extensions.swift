//
//  NewsService + Extensions.swift
//  News
//
//  Created by Марк Киричко on 10.07.2023.
//

import Alamofire

// MARK: - NewsServiceProtocol
extension NewsService: NewsServiceProtocol {
    
    func execute<T: Codable>(with type: T.Type, category: NewsCategory, completion: @escaping(Result<T, Error>)->Void) {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=ru&category=\(category.rawValue)&apiKey=\(Contacts.apiKey)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {return}
            
            do {
                let newsResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(newsResponse))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }.resume()
    }
}
