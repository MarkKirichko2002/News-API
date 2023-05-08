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
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $viewModel.searchText, prompt: "Поиск новостей")
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Spacer()
                            // иконка
                            SpringImageView(image: viewModel.CategoryIcon, width: 30, height: 30) {
                                viewModel.PlayCategorySound()
                            }
                            // название категории
                            Text(viewModel.title)
                                .fontWeight(.black)
                            // распознание речи
                            Button {
                                viewModel.RecognizeNewsCategories()
                            } label: {
                                Image(systemName: viewModel.ButtonImage)
                            }
                            // категории новостей
                            Picker("", selection: $viewModel.selectedNewsCategory) {
                                ForEach(Categories.categories, id: \.self) {
                                    Text($0.name)
                                }
                            }.onChange(of: viewModel.selectedNewsCategory) { category in
                                viewModel.GetNews(category: category)
                            }
                        }
                    }
                })
                .onAppear {
                    UITabBar.showTabBar(animated: true)
                }
        }
    }
}

struct TopNewsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchNewsListView()
    }
}
