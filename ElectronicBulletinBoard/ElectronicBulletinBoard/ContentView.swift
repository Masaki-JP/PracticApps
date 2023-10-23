//
//  ContentView.swift
//  ElectronicBulletinBoard
//
//  Created by Masaki Doi on 2023/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ElectronicBulletinBoardView(text: "GOOD MORNING!", width: 350)
        }
    }
}

#Preview {
    ContentView()
}
