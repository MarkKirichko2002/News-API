//
//  RoundedImageView.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct RoundedImageView: View {
    
    var image: String
    var width: CGFloat
    var height: CGFloat
    var color: Color
    var lineWidth: CGFloat
    
    var isURL: Bool
    
    var body: some View {
        if isURL {
            WebImage(url: URL(string: image))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .clipShape(Circle())
                .overlay(Circle().stroke(color, lineWidth: lineWidth))
        } else {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .clipShape(Circle())
                .overlay(Circle().stroke(color, lineWidth: lineWidth))
        }
    }
}

struct RoundedImageView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImageView(image: "news 1", width: 100, height: 100, color: .black, lineWidth: 5, isURL: false)
    }
}