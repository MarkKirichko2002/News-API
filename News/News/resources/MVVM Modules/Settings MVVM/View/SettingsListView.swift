//
//  SettingsListView.swift
//  News
//
//  Created by Марк Киричко on 07.05.2023.
//

import SwiftUI

struct SettingsListView: View {
    
    var viewModel = SettingsListViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
               
            }
           .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Image("settings")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
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
