//
//  AppState.swift
//  SplashScreen
//
//  Created by Masaki Doi on 2023/09/30.
//

import Foundation

class AppState: ObservableObject {
    // Singleton
    static let shared = AppState()
    private init(){}
    
    enum RootViews {
        case splash
        case content
    }
    
    @Published private(set) var rootView: RootViews = .splash
    
    func changeRootView(rootView: RootViews) {
        self.rootView = rootView
    }
}

