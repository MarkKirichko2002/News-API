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
                    Image(category.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
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
