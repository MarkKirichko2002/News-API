//
//  SettingsListView.swift
//  News
//
//  Created by Марк Киричко on 07.05.2023.
//

import SwiftUI

struct SettingsListView: View {
    
    @StateObject var viewModel = SettingsListViewViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.settings) { section in
                Section(header: Text(section.name).foregroundColor(.black).fontWeight(.bold)) {
                    Picker("Выберите иконку приложения", selection: $viewModel.activeAppIcon) {
                        ForEach(section.settings, id: \.AppIcon) { value in
                            HStack {
                                SpringImageView(image: value.icon, width: 50, height: 50) {}
                                Text(value.name)
                                    .fontWeight(.black)
                            }
                        }
                    }.pickerStyle(.inline)
                        .onChange(of: viewModel.activeAppIcon) { newValue in
                            print(newValue)
                            UIApplication.shared.setAlternateIconName(newValue)
                     }
                }
                Section(header: Text("интерактивность").foregroundColor(.black).fontWeight(.bold)) {
                    InteractiveOptionCell(isInteractiveOn: $viewModel.isInteractiveOn)
                }
                
                Section(header: Text("встряхните чтобы сгенерировать").foregroundColor(.black).fontWeight(.bold)) {
                    ShakeToGenerateOptionCell(isShakeToGenerateOn: $viewModel.isShakeToGenerateOn)
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
