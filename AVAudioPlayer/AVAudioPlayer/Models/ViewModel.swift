//
//  ViewModel.swift
//  AVAudioPlayer
//
//  Created by Masaki Doi on 2023/10/06.
//

import Foundation

final class ViewModel: ObservableObject {
    static let shared = ViewModel()
    private init() {}
    
    let audioPlayer = AudioPlayerModel.shared
    
    func playSound(_ audioObject: AudioObject) {
        // 事前通知
        objectWillChange.send()
        audioPlayer.playSound(audioObject)
    }
}
