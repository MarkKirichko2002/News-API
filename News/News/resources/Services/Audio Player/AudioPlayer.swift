//
//  AudioPlayer.swift
//  News
//
//  Created by Марк Киричко on 05.05.2023.
//

import AVFoundation

class AudioPlayer {
    
    private var player: AVAudioPlayer?
    
    func PlaySound(resource: String) {
        
        guard let url = Bundle.main.url(forResource: resource, withExtension: nil) else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func StopSound(resource: String) {

        guard let url = Bundle.main.url(forResource: resource, withExtension: nil) else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.stop()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
