//
//  AudioPlayer.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 23.08.2023.
//

import AVFoundation

class AudioPlayer {
    var audioPlayer: AVAudioPlayer?
    
    func playAudio() {
        guard let music = Bundle.main.url(forResource: "Music", withExtension: "mp3") else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: music)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Error playing music: \(error.localizedDescription)")
        }
    }    
}
