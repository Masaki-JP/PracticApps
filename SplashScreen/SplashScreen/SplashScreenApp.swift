//
//  SplashScreenApp.swift
//  SplashScreen
//
//  Created by Masaki Doi on 2023/09/30.
//

import SwiftUI

@main
struct SplashScreenApp: App {
    @StateObject private var appState = AppState.shared

    var body: some Scene {
        WindowGroup {
            switch appState.rootView {
            case .splash:
                SplashView()
            case .content:
                ContentView()
            }
        }
    }
}
