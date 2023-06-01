//
//  SpringImageView.swift
//  News
//
//  Created by Марк Киричко on 07.05.2023.
//

import SwiftUI

struct SpringImageView: View {
    
    @State var isAnimation = false
    
    var image: String
    var width: CGFloat
    var height: CGFloat
    var onTap: ()->Void
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
            
            .scaleEffect(isAnimation ? 1.1 : 1, anchor: .bottom)
            .animation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.4), value: isAnimation)
            .onTapGesture {
                isAnimation.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.isAnimation = false
                }
              onTap()
          }
    }
}

struct SpringView_Previews: PreviewProvider {
    static var previews: some View {
        SpringImageView(image: "news", width: 40, height: 40) {
            
        }
    }
}
