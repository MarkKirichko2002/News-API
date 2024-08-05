//
//  NewsTabView.swift
//  News
//
//  Created by Марк Киричко on 17.07.2022.
//

import SwiftUI

struct NewsTabView: View {
    var body: some View {
        TabView() {
            TopNewsListView()
                .tabItem {
                    Image(systemName: "flame")
                        .tint(Color.primary)
                    Text("главное")
                }
            
            NewsCategoriesListView()
                .tabItem {
                    Image(systemName: "newspaper")
                        .tint(Color.primary)
                    Text("категории")
                }
            
            RandomNewsListView()
                .tabItem {
                    Image(systemName: "dice")
                        .tint(Color.primary)
                    Text("рандом")
                }
            
            SearchNewsListView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .tint(Color.primary)
                    Text("поиск")
                }
        
            SettingsListView()
                .tabItem {
                    Image(systemName: "gear")
                        .tint(Color.primary)
                    Text("настройки")
                }
        }.accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView()
    }
}
