//
//  NewsView.swift
//  News
//
//  Created by Марк Киричко on 13.07.2022.
//

import SwiftUI
import SDWebImageSwiftUI
import HidableTabView

struct NewsView: View {
    
    var category: NewsCategory
    @ObservedObject var newsViewModel = NewsViewModel()
    @State var isAnimating = true
    
    var body: some View {
        List(newsViewModel.news, id: \.title) { article in
            NavigationLink {
                WebView(url: article.url)
            } label: {
                HStack(spacing: 15) {
                    WebImage(url: URL(string: article.urlToImage ?? ""), options: .highPriority, context: nil)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.black, lineWidth: 5))
                    
                    VStack(alignment: .leading) {
                        Text(article.title)
                            .fontWeight(.black)
                            .lineLimit(7)
                        Text(article.description ?? "")
                            .fontWeight(.medium)
                            .lineLimit(2)
                    }
                }
            }
        }.onAppear {
            newsViewModel.CurrentCategorySound(category: category)
            newsViewModel.CurrentCategory(category: category)
            newsViewModel.GetNews()
            UITabBar.hideTabBar(animated: true)
        }
        .navigationBarTitle(category.name)
    }
}


//struct NewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsView()
//    }
//}

