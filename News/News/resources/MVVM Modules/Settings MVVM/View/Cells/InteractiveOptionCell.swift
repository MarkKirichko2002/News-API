//
//  InteractiveOptionCell.swift
//  News
//
//  Created by Марк Киричко on 07.06.2023.
//

import SwiftUI

struct InteractiveOptionCell: View {
    
    @Binding var isInteractiveOn: Bool
    
    var body: some View {
        HStack {
            SpringImageView(image: "newspaper", width: 50, height: 50) {}
            Text(isInteractiveOn ? "вкл" : "выкл")
                .foregroundColor(isInteractiveOn ? .green : .gray)
                .fontWeight(.black)
            Toggle("", isOn: $isInteractiveOn)
        }
    }
}
