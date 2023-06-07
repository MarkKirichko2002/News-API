//
//  ShakeToGenerateOptionCell.swift
//  News
//
//  Created by Марк Киричко on 07.06.2023.
//

import SwiftUI

struct ShakeToGenerateOptionCell: View {
    
    @Binding var isShakeToGenerateOn: Bool
    
    var body: some View {
        HStack {
            SpringImageView(image: "dice", width: 50, height: 50) {}
            Text(isShakeToGenerateOn ? "вкл" : "выкл")
                .foregroundColor(isShakeToGenerateOn ? .green : .gray)
                .fontWeight(.black)
            Toggle("", isOn: $isShakeToGenerateOn)
        }
    }
}
