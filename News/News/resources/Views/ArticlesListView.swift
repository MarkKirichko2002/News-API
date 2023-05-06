//
//  ArticlesListView.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import SwiftUI

struct ArticlesListView: View {
    
    var news: [Article]
    
    var body: some View {
        List(news, id: \.title) { article in
            NavigationLink {
                WebView(url: article.url)
            } label: {
                ArticleCell(article: article)
            }
        }
    }
}

struct ArticlesListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesListView(news: [Article]())
    }
}
