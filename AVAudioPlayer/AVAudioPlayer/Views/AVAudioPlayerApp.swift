//
//  AVAudioPlayerApp.swift
//  AVAudioPlayer
//
//  Created by Masaki Doi on 2023/10/06.
//

import SwiftUI

@main
struct AVAudioPlayerApp: App {
    @StateObject var vm = ViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView(vm: vm)
        }
    }
}
