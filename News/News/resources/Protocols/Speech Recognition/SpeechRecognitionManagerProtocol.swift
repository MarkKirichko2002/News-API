//
//  SpeechRecognitionManagerProtocol.swift
//  News
//
//  Created by Марк Киричко on 03.07.2023.
//

import Foundation

protocol SpeechRecognitionManagerProtocol: AnyObject {
    func registerSpeechRecognitionHandler(block: @escaping(String)->Void)
    func startSpeechRecognition()
    func cancelSpeechRecognition()
}
