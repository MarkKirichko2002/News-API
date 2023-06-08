//
//  NotificationView.swift
//  News
//
//  Created by Марк Киричко on 08.06.2023.
//

import SwiftUI

struct NotificationView: View {
    
    var size: CGSize
    var category: NewsCategoryModel?
    @State var isExpanded: Bool = false
    @State var notification: NotificationModel?
    
    var body: some View {
        HStack(spacing: 10) {
            Image(category?.icon ?? "newspaper")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
            VStack(alignment: .leading, spacing: 10) {
                Text(category?.name ?? "")
                    .foregroundColor(.white)
                    .fontWeight(.black)
                Text("статей: \(category?.articlesCount ?? 0)")
                    .foregroundColor(.white)
                    .fontWeight(.black)
            }
        }
        .frame(width: isExpanded ? size.width - 22 : 126, height: isExpanded ? 120 : 37.33)
        .blur(radius: isExpanded ? 0 : 30)
        .opacity(isExpanded ? 1 : 0)
        .background {
            RoundedRectangle(cornerRadius: isExpanded ? 50 : 63, style: .continuous)
                .fill(.black)
        }
        .clipped()
        .offset(y: 11)
        .onReceive(NotificationCenter.default.publisher(for: .init("NOTIFY"))) { output in
            guard let notification = output.object as? NotificationModel else {return}
            self.notification = notification
            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.7, blendDuration: 0.7)) {
                DispatchQueue.main.async {
                    isExpanded = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                    withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.7, blendDuration: 0.7)) {
                        isExpanded = false
                        self.notification = nil
                    }
                }
            }
        }
    }
}

//struct NotificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationView()
//    }
//}
