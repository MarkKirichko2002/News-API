//
//  ContentView.swift
//  News
//
//  Created by Марк Киричко on 17.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            TopNewsView()
                .tabItem {
                    Image(systemName: "flame")
                    Text("главные новости")
                }
            
            NewsCategoriesView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("категории новостей")
                }
            
            SearchNewsView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("поиск новостей")
                }
        }.accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
