//
//  RandomManager + Extensions.swift
//  News
//
//  Created by Марк Киричко on 10.07.2023.
//

import Foundation

// MARK: - RandomManagerProtocol
extension RandomManager: RandomManagerProtocol {
    
    func ReturnRandomElement(array: [Any]) -> Any {
        return array.randomElement()!
    }
}
