//
//  SettingsSectionModel.swift
//  News
//
//  Created by Марк Киричко on 07.05.2023.
//

import Foundation

struct SettingsSectionModel: Identifiable {
    var id = UUID()
    let sectionName: String
    let settings: [SettingsModel]
}
