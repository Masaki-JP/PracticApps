//
//  AudioPlayerModel.swift
//  AVAudioPlayer
//
//  Created by Masaki Doi on 2023/10/06.
//

import UIKit
import AVFoundation

enum AudioObject {
    case success, failure, music
}

class AudioPlayerModel {
    // シングルトン化 & イニシャライザ
    static let shared = AudioPlayerModel()
    private init() {
        let successSound = NSDataAsset(name: "successSound")!
        let failureSound = NSDataAsset(name: "failureSound")!
        let music = NSDataAsset(name: "2_23_AM")!
        successSoundPlayer = try! AVAudioPlayer(data: successSound.data)
        failureSoundPlayer = try! AVAudioPlayer(data: failureSound.data)
        musicPlayer = try! AVAudioPlayer(data: music.data)
    }
    
    // AVAudioPlayer ×3
    private let successSoundPlayer: AVAudioPlayer
    private let failureSoundPlayer: AVAudioPlayer
    let musicPlayer: AVAudioPlayer
    
    // FeedbackGenerator
    let feedbackGenerator = FBGeneratorModel.shared
    
    // Play/Pause
    func playSound(_ audioObject: AudioObject) {
        switch audioObject {
        case .success:
            successSoundPlayer.play()
            feedbackGenerator.vibrate(isSuccess: true)
        case .failure:
            failureSoundPlayer.play()
            feedbackGenerator.vibrate(isSuccess: false)
        case .music:
            guard !musicPlayer.isPlaying else { musicPlayer.pause(); return; }
            musicPlayer.play()
        }
    }
}
