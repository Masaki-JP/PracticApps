//
//  SoundEffectView.swift
//  AVAudioPlayer
//
//  Created by Masaki Doi on 2023/10/06.
//

import SwiftUI

struct SoundEffectView: View {
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        VStack {
            Button("Success") {
                vm.playSound(.success)
            }
            .modifier(SoundEffectButton(backgroundColor: .green))
            
            Button("Failure") {
                vm.playSound(.failure)
            }
            .modifier(SoundEffectButton(backgroundColor: .pink))
            .padding(.top)
        }
    }
}

fileprivate struct SoundEffectButton: ViewModifier {
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.title.bold())
            .frame(width: 200)
            .padding(.vertical)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}

#Preview {
    SoundEffectView(vm: ViewModel.shared)
}
