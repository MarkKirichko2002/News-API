//
//  SettingsManagerProtocol.swift
//  News
//
//  Created by Марк Киричко on 10.07.2023.
//

import Foundation

protocol SettingsManagerProtocol {
    func checkSpeechRecognitionSetting()-> Bool
    func checkInteractiveSetting()-> Bool
}
