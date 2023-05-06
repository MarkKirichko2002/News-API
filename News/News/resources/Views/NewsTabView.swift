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
                    Text("главное")
                }
            
            NewsCategoriesListView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("категории")
                }
            
            RandomNewsListView()
                .tabItem {
                    Image(systemName: "dice")
                    Text("рандом")
                }
            
            SearchNewsListView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("поиск")
                }
        }.accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView()
    }
}
