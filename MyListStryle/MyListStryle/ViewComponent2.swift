import SwiftUI

#Preview {
    ZStack {
        LinearGradient(
            colors: [.green, .mint],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
        ViewComponent2(frameSize: 60)
    }
}

struct ViewComponent2: View {
    var foregroundColor = Color.white.opacity(0.7)
    var frameSize: CGFloat

    var body: some View {
        ViewComponent1(frameSize: frameSize * 0.5)
            .padding()
            .background(foregroundColor)
            .clipShape(Circle())
    }
}
