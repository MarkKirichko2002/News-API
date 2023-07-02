//
//  SettingsListViewViewModel.swift
//  News
//
//  Created by Марк Киричко on 07.05.2023.
//

import SwiftUI

class SettingsListViewViewModel: ObservableObject {
    
    @AppStorage("active_icon") var activeAppIcon: String = "AppIcon 1"
    @AppStorage("isMicrophoneOn") var isMicrophoneOn = false
    @AppStorage("isInteractiveOn") var isInteractiveOn = false
    @AppStorage("isShakeToGenerateOn") var isShakeToGenerateOn = false
    
    var settings = [
        SettingsSectionModel(id: 1, name: "Иконка", settings: [
            SettingsModel(id: 1, name: "газета", icon: "newspaper", AppIcon: "AppIcon 1"),
            SettingsModel(id: 2, name: "огонь", icon: "fire", AppIcon: "AppIcon 2"),
            SettingsModel(id: 3, name: "робот", icon: "technology", AppIcon: "AppIcon 3"),
            SettingsModel(id: 4, name: "мяч", icon: "sport", AppIcon: "AppIcon 4"),
            SettingsModel(id: 5, name: "монета", icon: "business", AppIcon: "AppIcon 5"),
            SettingsModel(id: 6, name: "микроскоп", icon: "science", AppIcon: "AppIcon 6"),
            SettingsModel(id: 7, name: "цирк", icon: "entertainment", AppIcon: "AppIcon 7"),
            SettingsModel(id: 8, name: "крест", icon: "health", AppIcon: "AppIcon 8")
        ])
    ]
}
