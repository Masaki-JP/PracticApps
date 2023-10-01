//
//  ContentView.swift
//  PageTabView
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
            Text("Here is HomeView.")
                .tag(ViewStatus.home)
            
            Text("Here is TopicView.")
                .tag(ViewStatus.topic)
            
            Text("Here is FavoriteView.")
                .tag(ViewStatus.favorite)
            
            Text("Here is SettingView.")
                .tag(ViewStatus.setting)
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ContentView()
}
