//
//  NewsCategoriesView.swift
//  News
//
//  Created by Марк Киричко on 13.07.2022.
//

import SwiftUI
import HidableTabView

struct NewsCategoriesView: View {
    
    var categories = [NewsCategory(id: 1, name: "главное"), NewsCategory(id: 2, name: "технологии"), NewsCategory(id: 3, name: "спорт"), NewsCategory(id: 4, name: "бизнес"), NewsCategory(id: 5, name: "развлечения")]
    
    var body: some View {
        NavigationView {
            List(categories) { category in
                NavigationLink {
                    NewsView(category: category)
                } label: {
                    HStack {
                        Text(category.name)
                            .font(.system(size: 20, weight: .bold, design: .default))
                    }
                }
            }
            .navigationBarTitle("Категории")
            .onAppear() {
                UITabBar.showTabBar(animated: true)
            }
        }
    }
}

struct NewsCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCategoriesView()
    }
}

