//
//  ContentView.swift
//  DefaultTabView
//
//  Created by Masaki Doi on 2023/10/02.
//

import SwiftUI

enum ViewStatus {
    case home, topic, favorite, setting
}

struct ContentView: View {
    @State var viewStatus = ViewStatus.home
    
    var body: some View {
        TabView(selection: $viewStatus) {
            Button("Here is TopView. Tap to go next.") {
                viewStatus = .topic
            }
            .tabItem { Image(systemName: "house"); Text("Top"); }
            .tag(ViewStatus.home)
            .badge(10)
            
            Button("Here is TopicView. Tap to go next.") {
                viewStatus = .favorite
            }
            .tabItem { Image(systemName: "newspaper"); Text("Topic"); }
            .tag(ViewStatus.topic)
            .badge("新着")
            
            Button("Here is FavoriteView. Tap to go next.") {
                viewStatus = .setting
            }
            .tabItem { Image(systemName: "star"); Text("Favorite"); }
            .tag(ViewStatus.favorite)
            
            Button("Here is SettingView. Tap to go next.") {
                viewStatus = .home
            }
            .tabItem { Image(systemName: "gearshape"); Text("Setting"); }
            .tag(ViewStatus.setting)
        }
    }
}

#Preview {
    ContentView()
}
