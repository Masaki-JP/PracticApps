import SwiftUI

struct ContentView: View {
    @State private var title = "美容院の予約"
    @State private var deadline = "明日の夜"
    @State private var note = "散髪代 128,000円"
    @FocusState private var focusState: FocusedTextField?

    enum FocusedTextField {
        case title, deadline, note
    }

    var body: some View {
        VStack(spacing: 30) {
            LabeledTextField(
                title: "名前",
                text: $title,
                focusState: $focusState,
                focusCase: .title,
                returnKeyType: .next,
                dismissKeyboardAfterCompletion: false) {
                    focusState = .deadline
                }
            LabeledTextField(
                title: "期限",
                text: $deadline,
                focusState: $focusState,
                focusCase: .deadline,
                returnKeyType: .done,
                dismissKeyboardAfterCompletion: true) {
                    print("名前:", title)
                    print("期限:", deadline)
                    print("注釈:", note)
                    title.removeAll()
                    deadline.removeAll()
                    note.removeAll()
                }
            LabeledMultipleTextField(
                title: "注釈",
                text: $note,
                focusState: $focusState,
                focusCase: .note
            )
        }
        .padding(.horizontal)
    }
}

#Preview("Light") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark") {
    ContentView()
        .preferredColorScheme(.dark)
}
