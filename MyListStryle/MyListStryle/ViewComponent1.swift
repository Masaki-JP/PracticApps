import SwiftUI

#Preview {
    ViewComponent1()
}

///// 1.0
//
//struct ViewComponent1: View {
//    var body: some View {
//        let fullSize: CGFloat = 350
//        ZStack {
//            makeHorizontalCapsule(a: .topLeading)
//            makeVerticalCapsule(a: .topLeading)
//
//            makeHorizontalCapsule(a: .topTrailing)
//            makeVerticalCapsule(a: .topTrailing)
//
//            Image(systemName: "magnifyingglass")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 200)
//
//            makeHorizontalCapsule(a: .bottomLeading)
//            makeVerticalCapsule(a: .bottomLeading)
//
//            makeHorizontalCapsule(a: .bottomTrailing)
//            makeVerticalCapsule(a: .bottomTrailing)
//        }
//        .frame(width: fullSize, height: fullSize)
//    }
//}
//
//@ViewBuilder
//func makeHorizontalCapsule(a: Alignment) -> some View {
//    Capsule()
//        .frame(width: 100, height: 20)
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: a)
//}
//
//@ViewBuilder
//func makeVerticalCapsule(a: Alignment) -> some View {
//    Capsule()
//        .frame(width: 20, height: 100)
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: a)
//}





///// 2.0
//
//struct ViewComponent1: View {
//    var body: some View {
//        let fullSize: CGFloat = 350
//        ZStack {
//            Image(systemName: "magnifyingglass")
//                .resizable()
//                .scaledToFit()
//                .frame(width: fullSize*0.6, height: fullSize*0.6)
//            makeBrackets(length: fullSize*0.3, thickness: fullSize*0.05)
//        }
//        .frame(width: fullSize, height: fullSize)
//    }
//}
//
//@ViewBuilder
//func makeBrackets(length: CGFloat, thickness: CGFloat) -> some View {
//    let alignments: [Alignment] = [.topLeading, .topTrailing, .bottomLeading, .bottomTrailing]
//
//    ForEach(alignments.indices, id: \.self) { i in
//        Capsule()
//            .frame(width: length, height: thickness)
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignments[i])
//        Capsule()
//            .frame(width: thickness, height: length)
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignments[i])
//    }
//}





/// 3.0

struct ViewComponent1: View {
    var foregroundColor = Color(red: 0.3, green: 0.3, blue: 0.3)
    var frameSize: CGFloat = 300

    var body: some View {
        ZStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .fontWeight(.medium)
                .frame(width: frameSize * 0.625, height: frameSize * 0.625)
            makeBrackets(length: frameSize * 0.3, thickness: frameSize * 0.05)
        }
        .frame(width: frameSize, height: frameSize)
        .foregroundStyle(foregroundColor)
    }
}

@ViewBuilder
func makeBrackets(length: CGFloat, thickness: CGFloat) -> some View {
    let alignments: [Alignment] = [.topLeading, .topTrailing, .bottomLeading, .bottomTrailing]

    ForEach(alignments.indices, id: \.self) { i in
        Capsule()
            .frame(width: length, height: thickness)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignments[i])
        Capsule()
            .frame(width: thickness, height: length)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignments[i])
    }
}
