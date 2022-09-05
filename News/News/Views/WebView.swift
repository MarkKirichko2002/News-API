//
//  URLView.swift
//  News
//
//  Created by Марк Киричко on 13.07.2022.
//

import SwiftUI
import WebKit
import HidableTabView

struct WebView: UIViewRepresentable {
    
    
    var url: String
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        
        let view = WKWebView()
        DispatchQueue.main.async {
            view.load(URLRequest(url: URL(string: url)!))
        }
        return view
        
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        UITabBar.hideTabBar(animated: true)
    }
    
}

//struct URLView_Previews: PreviewProvider {
//    static var previews: some View {
//        URLView()
//    }
//}

