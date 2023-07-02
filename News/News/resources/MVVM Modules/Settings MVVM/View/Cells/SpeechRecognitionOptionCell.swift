//
//  SpeechRecognitionOptionCell.swift
//  News
//
//  Created by Марк Киричко on 03.07.2023.
//

import SwiftUI

struct SpeechRecognitionOptionCell: View {
    
    @Binding var isMicrophoneOn: Bool
    
    var body: some View {
        HStack {
            SpringImageView(image: "microphone", width: 50, height: 50) {}
            Text(isMicrophoneOn ? "вкл" : "выкл")
                .foregroundColor(isMicrophoneOn ? .green : .gray)
                .fontWeight(.black)
            Toggle("", isOn: $isMicrophoneOn)
        }
    }
}
