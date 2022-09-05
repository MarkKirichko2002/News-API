//
//  SplashView.swift
//  News
//
//  Created by Марк Киричко on 26.07.2022.
//

import SwiftUI

struct SplashView: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
       // Customise your SplashScreen here
       var body: some View {
           
           if isActive {
               ContentView()
           } else {
               VStack {
                   VStack {
                       Image("news")
                           .resizable()
                           .aspectRatio(contentMode: .fill)
                           .frame(width: 80, height: 80)
                           .clipShape(Circle())
                           .overlay(Circle().stroke(Color.black, lineWidth: 4))
                       Text("Новости 2022")
                           .fontWeight(.black)
                           .foregroundColor(.black.opacity(0.80))
                   }
                   .scaleEffect(size)
                   .opacity(opacity)
                   .onAppear {
                       withAnimation(.easeIn(duration: 1.2)) {
                           self.size = 1.9
                           self.opacity = 1.00
                       }
                   }
               }
               .onAppear {
                   DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                       withAnimation {
                           self.isActive = true
                       }
                   }
               }
           }
     }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
