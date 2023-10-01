//
//  ContentView.swift
//  Feedback
//
//  Created by Masaki Doi on 2023/10/02.
//

import SwiftUI

struct ContentView: View {
    private let generator = UINotificationFeedbackGenerator()
    
    var body: some View {
        Button("success") {
            generator.notificationOccurred(.success)
        }
        .modifier(MyButtonStyle(color: .blue))
        
        Button("warning") {
            generator.notificationOccurred(.warning)
        }
        .modifier(MyButtonStyle(color: .yellow))
        .padding(.top)
        
        Button("error") {
            generator.notificationOccurred(.error)
        }
        .modifier(MyButtonStyle(color: .red))
        .padding(.top)
    }
}

private struct MyButtonStyle: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: 150)
            .bold()
            .font(.title)
            .padding()
            .foregroundColor(.white)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}

#Preview {
    ContentView()
}
