//
//  SoundPlayer.swift
//  Practice_Sound
//
//  Created by 土井正貴 on 2022/09/19.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {

    let completedSound = NSDataAsset(name: "Sound_Completed")!.data
    let alertSound = NSDataAsset(name: "Sound_Alert")!.data

    var completedSoundPlayer: AVAudioPlayer!
    var alertSoundPlayer: AVAudioPlayer!

    func completedSoundPlay() {

        do {
            completedSoundPlayer = try AVAudioPlayer(data: completedSound)
            completedSoundPlayer.play()
        } catch {
            fatalError("エラー発生")
        }
    }

    func alertSoundPlay() {

        do {
            alertSoundPlayer = try AVAudioPlayer(data: alertSound)
            alertSoundPlayer.play()
        } catch {
            fatalError("エラー発生")
        }
    }
}
