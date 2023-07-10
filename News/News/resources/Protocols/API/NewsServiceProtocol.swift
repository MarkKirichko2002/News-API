//
//  NewsServiceProtocol.swift
//  News
//
//  Created by Марк Киричко on 10.07.2023.
//

import Foundation

protocol NewsServiceProtocol {
    func execute<T: Codable>(with type: T.Type, category: NewsCategory, completion: @escaping(Result<T, Error>)->Void)
}
