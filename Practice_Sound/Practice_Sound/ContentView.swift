//
//  ContentView.swift
//  Practice_Sound
//
//  Created by 土井正貴 on 2022/09/19.
//

import SwiftUI

struct ContentView: View {

    let soundPlayer = SoundPlayer()
    let feedbackGenerator = UINotificationFeedbackGenerator()

    var body: some View {
        VStack(spacing: 30) {

            Button {
                soundPlayer.completedSoundPlay()
                feedbackGenerator.notificationOccurred(.success)
            } label: {
                Text("成功音")
                    .font(.title)
                    .frame(width: 200)
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .background(.green)
                    .cornerRadius(10)
            }

            Button {
                soundPlayer.alertSoundPlay()
                feedbackGenerator.notificationOccurred(.error)
            } label: {
                Text("失敗音")
                    .font(.title)
                    .frame(width: 200)
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(10)
            }

            Button {
                UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
                    exit(0)
                }
            } label: {
                Text("アプリを閉じる")
                    .bold()
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.gray)
                    .cornerRadius(3)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
