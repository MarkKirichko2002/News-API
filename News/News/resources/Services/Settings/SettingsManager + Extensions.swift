//
//  SettingsManager + Extensions.swift
//  News
//
//  Created by Марк Киричко on 10.07.2023.
//

import Foundation

// MARK: - SettingsManagerProtocol
extension SettingsManager: SettingsManagerProtocol {
    
    func checkSpeechRecognitionSetting()-> Bool {
        if isMicrophoneOn {
            return true
        } else {
            return false
        }
    }
    
    func checkInteractiveSetting()-> Bool {
        if isInteractiveOn {
            return true
        } else {
            return false
        }
    }
}
