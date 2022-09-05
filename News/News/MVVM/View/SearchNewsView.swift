//
//  SearchNewsView.swift
//  News
//
//  Created by Марк Киричко on 14.07.2022.
//

import SwiftUI
import HidableTabView
import SDWebImageSwiftUI

struct SearchNewsView: View {
    
    @State var isAnimating = true
    @State var ButtonImage = "mic"
    @State private var searchText = ""
    @ObservedObject var newsViewModel = NewsViewModel()
    
    var body: some View {
        
        NavigationView {
            List(filteredNews, id: \.title) { article in
                NavigationLink {
                    WebView(url: article.url)
                } label: {
                    HStack(spacing: 15) {
                        WebImage(url: URL(string: article.urlToImage ?? ""))
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
            }
            .toolbar(content: {
                
                ToolbarItem(){
                    
                    HStack {
                        
                        
                        Button {
                            newsViewModel.isStart = !newsViewModel.isStart
                            if newsViewModel.isStart {
                                newsViewModel.startSpeechRecognization()
                                ButtonImage = "mic.fill"
                                newsViewModel.text = "Поиск..."
                            } else {
                                newsViewModel.cancelSpeechRecognization()
                                ButtonImage = "mic"
                            }
                            
                        } label: {
                            Image(systemName: ButtonImage)
                        }
                        
                        Button(action: {
                            newsViewModel.RandomCategory()
                        }) {
                            Image(systemName: "dice")
                        }
                    }
                }
            })
            .navigationBarTitle(newsViewModel.text)
            .searchable(text: $searchText, prompt: "Поиск новостей")
            .onAppear {
                DispatchQueue.main.async {
                    newsViewModel.GetNews()
                    UITabBar.showTabBar(animated: true)
                }
            }
            .onChange(of: newsViewModel.url) { _ in
                newsViewModel.GetNews()
            }
        }
    }
    
    var filteredNews: [Article]  {
        if searchText.isEmpty {
            return newsViewModel.news
        } else {
            return newsViewModel.news.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct TopNewsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchNewsView()
    }
}

