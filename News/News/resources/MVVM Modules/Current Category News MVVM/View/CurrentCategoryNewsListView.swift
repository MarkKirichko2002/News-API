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
        Form() {
            Section() {
                NewsCategoryCell(category: category)
            }
            Section() {
                ArticlesListView(news: viewModel.news)
            }
        }.navigationBarTitle(category.name)
        .onAppear {
            viewModel.GetCurrentCategoryNews(endpoint: category.endpoint)
            viewModel.PlayCurrentNewsCategorySound(sound: category.sound)
            UITabBar.hideTabBar(animated: true)
        }
    }
}
