//
//  ContentView.swift
//  SplashScreen
//
//  Created by Masaki Doi on 2023/09/30.
//

import SwiftUI

///
/// changeRootViewメソッドは、ビューに使用されているプロパティを変更するといったものではないが、ビューを再描画させるため、メインスレッドで実行する必要がある。
///

struct SplashView: View {
    var body: some View {
        Text("SplashView")
            .bold().font(.largeTitle).foregroundColor(.red)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    AppState.shared.changeRootView(rootView: .content)
                }
            }
    }
}

struct ContentView: View {
    var body: some View {
        Text("ContentView")
            .bold().font(.largeTitle).foregroundColor(.blue)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    AppState.shared.changeRootView(rootView: .splash)
                }
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
