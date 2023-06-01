//
//  CurrentCategoryNewsListView.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import SwiftUI
import HidableTabView

struct CurrentCategoryNewsListView: View {
    
    @ObservedObject var viewModel = CurrentCategoryNewsListViewViewModel()
    var category: NewsCategoryModel
    
    var body: some View {
        ArticlesListView(news: viewModel.news)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                HStack {
                    SpringImageView(image: category.icon, width: 35, height: 35) {
                        viewModel.PlayCurrentNewsCategorySound(sound: category.sound)
                    }
                    Text(category.name)
                        .fontWeight(.black)
                }
           }
       })
        .onAppear {
            viewModel.GetCurrentCategoryNews(endpoint: category.endpoint)
            viewModel.PlayCurrentNewsCategorySound(sound: category.sound)
            UITabBar.hideTabBar(animated: true)
        }
    }
}
