//
//  SettingsSectionModel.swift
//  News
//
//  Created by Марк Киричко on 01.06.2023.
//

import Foundation

struct SettingsSectionModel: Identifiable {
    var id: Int
    var name: String
    var settings: [SettingsModel]
}
