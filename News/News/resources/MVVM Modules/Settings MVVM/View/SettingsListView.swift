//
//  SettingsListView.swift
//  News
//
//  Created by Марк Киричко on 07.05.2023.
//

import SwiftUI

struct SettingsListView: View {
    
    @AppStorage("active_icon") var activeAppIcon: String = "AppIcon 1"
    var viewModel = SettingsListViewViewModel()
    var customIcons = ["AppIcon 1", "AppIcon 2", "AppIcon 3", "AppIcon 4", "AppIcon 5", "AppIcon 6", "AppIcon 7", "AppIcon 8"]
    
    var body: some View {
        NavigationView {
            List(viewModel.settings) { section in
                Section(section.name) {
                    Picker("Выберите иконку приложения", selection: $activeAppIcon) {
                        ForEach(section.settings, id: \.AppIcon) { value in
                            HStack {
                                SpringImageView(image: value.icon, width: 50, height: 50) {}
                                Text(value.name)
                                    .fontWeight(.black)
                                //Text(value.AppIcon)
                            }
                        }
                    }.pickerStyle(.inline)
                        .onChange(of: activeAppIcon) { newValue in
                            print(newValue)
                            UIApplication.shared.setAlternateIconName(newValue)
                     }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    HStack {
                        SpringImageView(image: "gear", width: 35, height: 30) {
                            
                        }
                        Text("Настройки")
                            .fontWeight(.black)
                    }
                }
            })
        }
    }
}

struct SettingsListView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsListView()
    }
}
