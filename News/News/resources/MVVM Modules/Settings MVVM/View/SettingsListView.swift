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
                            SpringImageView(image: "gear", width: 30, height: 30) {
                                
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
