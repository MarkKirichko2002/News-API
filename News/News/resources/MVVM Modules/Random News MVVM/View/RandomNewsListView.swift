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
                            Text(viewModel.title)
                                .fontWeight(.black)
                            Spacer()
                            Button(action: {
                                viewModel.GenerateRandomNews()
                            }) {
                                Image("dice")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                            }
                        }
                    }
                })
                .onAppear {
                    UITabBar.showTabBar(animated: true)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(alignment: .top) {
                    GeometryReader { proxy in
                        let size = proxy.size
                        if UIDevice.hasDynamicIsland {
                            NotificationView(size: size, category: viewModel.randomCategory).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        }
                    }
                    .ignoresSafeArea()
                }
                .onShake {
                    if viewModel.isShakeToGenerateOn {
                        viewModel.GenerateRandomNews()
                    } else {}
             }
        }
    }
}

struct RandomNewsListView_Previews: PreviewProvider {
    static var previews: some View {
        RandomNewsListView()
    }
}
