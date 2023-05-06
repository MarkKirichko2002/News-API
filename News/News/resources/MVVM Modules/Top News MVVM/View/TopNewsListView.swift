//
//  TopNewsListView.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import SwiftUI
import HidableTabView

struct TopNewsListView: View {
        
    @ObservedObject var viewModel = TopNewsListViewViewModel()
    
    var body: some View {
        NavigationView {
            ArticlesListView(news: viewModel.news)
            .navigationBarTitle("Главное")
            .onAppear {
                UITabBar.showTabBar(animated: true)
            }
            .toolbar(content: {
                ToolbarItem() {
                    HStack {
                        Image("top news")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                    }
               }
           })
        }
    }
}

struct TopNewsListView_Previews: PreviewProvider {
    static var previews: some View {
        TopNewsListView()
    }
}
