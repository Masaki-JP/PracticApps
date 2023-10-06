//
//  ContentView.swift
//  AVAudioPlayer
//
//  Created by Masaki Doi on 2023/10/06.
//

import SwiftUI

///
/// AVAudioPlayerは音源ごとに作成する必要がある。
///

struct ContentView: View {
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        TabView {
            SoundEffectView(vm: vm)
            
            MusicView(vm: vm)
        }
        .tabViewStyle(.page)
    }
}



#Preview {
    ContentView(vm: ViewModel.shared)
}
