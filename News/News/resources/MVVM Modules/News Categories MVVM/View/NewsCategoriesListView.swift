//
//  NewsCategoriesListView.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import SwiftUI
import HidableTabView

struct NewsCategoriesListView: View {
    
    @ObservedObject var viewModel = NewsCategoriesListViewViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.categories) { category in
                NavigationLink {
                    CurrentCategoryNewsListView(category: category)
                } label: {
                    NewsCategoryCell(category: category)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("news")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                        Text("Категории")
                            .fontWeight(.black)
                    }
                }
            })
            .onAppear {
                UITabBar.showTabBar(animated: true)
            }
        }
    }
}

struct NewsCategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCategoriesListView()
    }
}
