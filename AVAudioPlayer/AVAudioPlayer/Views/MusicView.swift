//
//  MusicView.swift
//  AVAudioPlayer
//
//  Created by Masaki Doi on 2023/10/06.
//

import SwiftUI

struct MusicView: View {
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        VStack {
            Image(systemName:  !vm.audioPlayer.musicPlayer.isPlaying ? "play.rectangle.fill" : "pause.rectangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .foregroundStyle(.blue)
            
            Button("Play / Pause") {
                vm.playSound(.music)
            }
            .font(.title.bold())
            .padding(.top)
        }
    }
    
}

#Preview {
    MusicView(vm: ViewModel.shared)
}
