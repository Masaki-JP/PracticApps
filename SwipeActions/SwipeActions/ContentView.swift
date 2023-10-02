//
//  ContentView.swift
//  SwipeActions
//
//  Created by Masaki Doi on 2023/10/02.
//

///
/// 高さがある場合は、ラベルとテキストが表示される。
///

import SwiftUI

struct ContentView: View {
    @State var points = 0
    
    var body: some View {
        NavigationView {
            List {
                Section(content: {
                    Text("ValidFullSwipe\nAppearance: LabelOnly") // 明示的にtrue
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button {
                                points += 1
                            } label: {
                                Label("Plus", systemImage: "sun.max")
                            }
                            .tint(.red)
                        }
                    
                    Text("\nInvalidFullSwipe\nAppearance: Label and Text\n")
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button {
                                points += 1
                            } label: {
                                Label("Plus", systemImage: "moon.fill")
                            }
                            .tint(.blue)
                        }
                    
                    Text("ValidFullSwipe / Two buttons / .trailing")
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button {
                                points -= 1
                            } label: {
                                Text("-")
                            }
                            .tint(.red)
                            Button {
                                points += 1
                            } label: {
                                Text("+")
                            }
                            .tint(.blue)
                        }
                }, footer: {
                    Text("Points: \(points)")
                        .font(.title3)
                })
            }
            .navigationTitle("SwipeActions")
        }
    }
}

#Preview {
    ContentView()
}
