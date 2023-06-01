//
//  TopNewsListView.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import SwiftUI
import HidableTabView

struct TopNewsListView: View {
        
    @ObservedObject var viewModel = TopNewsListViewViewModel()
    
    var body: some View {
        NavigationView {
            ArticlesListView(news: viewModel.news)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    HStack {
                        SpringImageView(image: "fire", width: 35, height: 35) {
                            viewModel.PlaySound()
                        }
                        Text("Главное")
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

struct TopNewsListView_Previews: PreviewProvider {
    static var previews: some View {
        TopNewsListView()
    }
}
