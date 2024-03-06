import SwiftUI


// タップ判定？が悪さしてる疑惑

struct ContentView: View {
    private let objectSize: (width: CGFloat, height: CGFloat) = (300, 50)
    @State private var offset: CGSize = .zero
    @State private var initialDragOffset: CGSize = .zero

    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(
                        width: objectSize.width,
                        height: objectSize.height
                    )
                    .foregroundStyle(.pink)
                Rectangle()
                    .frame(
                        width: objectSize.width,
                        height: objectSize.height
                    )
                    .offset(offset)
                    .gesture(dragGesture)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .bottom) {
            VStack {
                Text("Offset.width: \(offset.width)")
                Text("Offset.height: \(offset.height)")
            }
        }
    }

    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                if initialDragOffset == .zero {
                    initialDragOffset = CGSize(
                        width: value.startLocation.x - objectSize.width / 2 - offset.width,
                        height: 0
                    )
                }
                let width = value.location.x - objectSize.width / 2 - initialDragOffset.width

                guard width < 0 else { return }
                guard width > -100 else { return }

                self.offset = CGSize(
                    width: width,
                    height: 0
                )
            }
            .onEnded { _ in
                initialDragOffset = .zero
            }
    }
}











//// カクカクスライダー
//
//struct ContentView: View {
//    private let objectSize: (width: CGFloat, height: CGFloat) = (300, 50)
//    @State private var offset: CGSize = .zero
//    @State private var initialDragOffset: CGSize = .zero
//
//    var body: some View {
//        VStack {
//            ZStack {
//                Rectangle()
//                    .frame(
//                        width: objectSize.width,
//                        height: objectSize.height
//                    )
//                    .foregroundStyle(.pink)
//                Rectangle()
//                    .frame(
//                        width: objectSize.width,
//                        height: objectSize.height
//                    )
//                    .offset(offset)
//                    .gesture(dragGesture)
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .overlay(alignment: .bottom) {
//            VStack {
//                Button("Print") { print(offset) }
//                Text("Offset.width: \(offset.width)")
//                Text("Offset.height: \(offset.height)")
//            }
//        }
//    }
//
//    var dragGesture: some Gesture {
//        DragGesture()
//            .onChanged { value in
//                if initialDragOffset == .zero {
//                    initialDragOffset = CGSize(
//                        width: value.startLocation.x - objectSize.width / 2 - offset.width,
//                        height: 0
//                    )
//                }
//                let width = value.location.x - objectSize.width / 2 - initialDragOffset.width
//
//                if width > -100, width < 0 {
//                    self.offset = CGSize(
//                        width: -100,
//                        height: 0
//                    )
//                } else if width > 0 {
//                    self.offset = CGSize(
//                        width: 0,
//                        height: 0
//                    )
//                }
//            }
//            .onEnded { _ in
//                initialDragOffset = .zero
//            }
//    }
//}














//struct ContentView: View {
//    private let objectSize: (width: CGFloat, height: CGFloat) = (300, 50)
//    @State private var offset: CGSize = .zero
//    @State private var initialDragOffset: CGSize = .zero
//
//    var body: some View {
//        VStack {
//            ZStack {
//                Rectangle()
//                    .frame(
//                        width: objectSize.width,
//                        height: objectSize.height
//                    )
//                    .foregroundStyle(.pink)
//                Rectangle()
//                    .frame(
//                        width: objectSize.width,
//                        height: objectSize.height
//                    )
//                    .offset(offset)
//                    .gesture(dragGesture)
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .overlay(alignment: .bottom) {
//            VStack {
//                Button("Print") { print(offset) }
//                Text("Offset.width: \(offset.width)")
//                Text("Offset.height: \(offset.height)")
//            }
//        }
//    }
//
//    var dragGesture: some Gesture {
//        DragGesture()
//            .onChanged { value in
//                if initialDragOffset == .zero {
//                    initialDragOffset = CGSize(
//                        width: value.startLocation.x - objectSize.width / 2 - offset.width,
//                        height: 0
//                    )
//                }
//                self.offset = CGSize(
//                    width: value.location.x - objectSize.width / 2 - initialDragOffset.width,
//                    height: 0
//                )
//            }
//            .onEnded { _ in
//                initialDragOffset = .zero
//            }
//    }
//}

#Preview {
    ContentView()
}
