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
                            Image(viewModel.CategoryIcon)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .onTapGesture {
                                    viewModel.PlayCategorySound()
                                }
                            Text(viewModel.title)
                                .fontWeight(.black)
//                            Spacer()
                            Button {
                                viewModel.RecognizeNewsCategories()
                            } label: {
                                Image(systemName: viewModel.ButtonImage)
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
