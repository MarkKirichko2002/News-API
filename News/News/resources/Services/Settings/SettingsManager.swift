//
//  SettingsManager.swift
//  News
//
//  Created by Марк Киричко on 03.07.2023.
//

import SwiftUI

class SettingsManager {
    
    @AppStorage("isInteractiveOn") var isInteractiveOn = false
    @AppStorage("isMicrophoneOn") var isMicrophoneOn = false
    
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
