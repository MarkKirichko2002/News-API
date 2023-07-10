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
    
}
