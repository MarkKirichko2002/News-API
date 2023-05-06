//
//  RandomNewsListView.swift
//  News
//
//  Created by Марк Киричко on 06.05.2023.
//

import SwiftUI
import HidableTabView

struct RandomNewsListView: View {
    
    @ObservedObject var viewModel = RandomNewsListViewViewModel()
    
    var body: some View {
        NavigationView {
            ArticlesListView(news: viewModel.news)
                .navigationBarTitle(viewModel.title)
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
                                viewModel.GenerateRandomNews()
                            } label: {
                                Image(systemName: "dice")
                            }
                        }
                   }
             })
        }
    }
}

struct RandomNewsListView_Previews: PreviewProvider {
    static var previews: some View {
        RandomNewsListView()
    }
}
