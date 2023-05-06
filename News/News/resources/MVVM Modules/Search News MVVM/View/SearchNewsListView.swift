//
//  SearchNewsListView.swift
//  News
//
//  Created by Марк Киричко on 14.07.2022.
//

import SwiftUI
import HidableTabView

struct SearchNewsListView: View {
    
    @ObservedObject var viewModel = SearchNewsListViewViewModel()
    
    var body: some View {
        NavigationView {
            ArticlesListView(news: viewModel.SearchNews())
                .navigationBarTitle(viewModel.title)
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $viewModel.searchText, prompt: "Поиск новостей")
                .onAppear {
                    UITabBar.showTabBar(animated: true)
                }
                .toolbar(content: {
                    ToolbarItem() {
                        HStack {
                            Image(viewModel.CategoryIcon)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .onTapGesture {
                                    viewModel.PlayCategorySound()
                                }
                            Button {
                                viewModel.RecognizeNewsCategories()
                            } label: {
                                Image(systemName: viewModel.ButtonImage)
                            }
                        }
                   }
             })
        }
    }
}

struct TopNewsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchNewsListView()
    }
}
