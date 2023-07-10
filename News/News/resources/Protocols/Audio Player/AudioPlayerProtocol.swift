//
//  AudioPlayerProtocol.swift
//  News
//
//  Created by Марк Киричко on 10.07.2023.
//

import Foundation

protocol AudioPlayerProtocol {
    func PlaySound(resource: String)
    func StopSound(resource: String)
}
