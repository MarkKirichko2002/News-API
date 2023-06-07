//
//  RoundedImageView.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct RoundedImageView: View {
    
    @State var isAnimation = false
    
    var image: String
    var width: CGFloat
    var height: CGFloat
    var color: Color
    var lineWidth: CGFloat
    var sound: String
    var isURL: Bool
    
    private let player = AudioPlayer()
    @AppStorage("isInteractiveOn") var isInteractiveOn = false
    
    var body: some View {
        if isURL {
            WebImage(url: URL(string: image))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .clipShape(Circle())
                .overlay(Circle().stroke(color, lineWidth: lineWidth))
            // MARK: - пружинная анимация
                .scaleEffect(isAnimation ? 1.1 : 1, anchor: .bottom)
                .animation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.4), value: isAnimation)
                .onTapGesture {
                    if isInteractiveOn {
                        isAnimation.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            self.isAnimation = false
                        }
                        player.PlaySound(resource: sound)
                    }
                }
        } else {
            SpringImageView(image: image, width: width, height: height) {
                player.PlaySound(resource: sound)
            }.clipShape(Circle())
                .overlay(Circle().stroke(color, lineWidth: lineWidth))
        }
    }
}

struct RoundedImageView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImageView(image: "news 1", width: 100, height: 100, color: .black, lineWidth: 5, sound: "newspaper.mp3", isURL: false)
    }
}
