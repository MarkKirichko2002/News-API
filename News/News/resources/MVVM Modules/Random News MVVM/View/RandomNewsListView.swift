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
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            SpringImageView(image: viewModel.CategoryIcon, width: 35, height: 35) {
                                viewModel.PlayCategorySound()
                            }
                            Text(viewModel.title)
                                .fontWeight(.black)
                            Button(action: {
                                viewModel.GenerateRandomNews()
                            }) {
                                Image(systemName: "dice")
                            }
                        }
                    }
                })
                .onAppear {
                    UITabBar.showTabBar(animated: true)
                }
                .onShake {
                    viewModel.GenerateRandomNews()
                }
          }
    }
}

struct RandomNewsListView_Previews: PreviewProvider {
    static var previews: some View {
        RandomNewsListView()
    }
}
