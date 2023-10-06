//
//  FBGeneratorModel.swift
//  AVAudioPlayer
//
//  Created by Masaki Doi on 2023/10/06.
//

import UIKit

final class FBGeneratorModel {
    static let shared = FBGeneratorModel()
    private init() {}
    
    private let generator = UINotificationFeedbackGenerator()
    
    func vibrate(isSuccess: Bool) {
        if isSuccess {
            generator.notificationOccurred(.success)
        } else {
            generator.notificationOccurred(.error)
        }
    }
}
