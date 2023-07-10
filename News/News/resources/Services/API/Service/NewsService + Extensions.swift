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
        url = "https://newsapi.org/v2/top-headlines?country=ru&category=\(category.rawValue)&apiKey=\(Contacts.apiKey)"
        
        AF.request(url).responseData { response in
            guard let data = response.data else {return}
            
            do {
                let newsResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(newsResponse))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
    }
}
