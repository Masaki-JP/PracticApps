//
//  ContentView.swift
//  GeminiPro
//
//  Created by Masaki Doi on 2023/12/22.
//

import SwiftUI
import GoogleGenerativeAI
// https://zenn.dev/holoholo/articles/8540f9a943cf4e

//// ver 1.0
//struct ContentView: View {
//    let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)
//    @State private var promptText = ""
//    @State private var responseText = ""
//    var body: some View {
//        VStack {
//            Text(responseText)
//                .frame(height: 100)
//                 .frame(maxWidth: .infinity)
//                 .border(Color(.systemGray4))
//
//             TextField("prompt", text: $promptText)
//                 .textFieldStyle(.roundedBorder)
//
//            Button("Generate") {
//                Task {
//                    let response = try await model.generateContent(promptText)
//                    if let text = response.text {
//                      responseText = text
//                    }
//                }
//            }
//            .buttonStyle(.borderedProminent)
//        }
//        .padding(.horizontal)
//    }
//}


//// ver 2.0
//struct Chat: Identifiable {
//    let id = UUID()
//    let question: String
//    let answer: String
//
//    init(question: String, answer: String) {
//        self.question = "Q. " + question
//        self.answer = "A. " + answer
//    }
//}
//
//struct ContentView: View {
//    let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)
//    @State private var chats: [Chat] = []
//    @State private var text = ""
//    @State private var isGenerating = false
//
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Color(.systemGray6).ignoresSafeArea()
//                ScrollView {
//                    VStack(alignment: .leading) {
//                        ForEach(chats) { chat in
//                            Text(chat.question)
//                                .fontWeight(.semibold)
//                            Text(chat.answer)
//                                .padding(.top, 5)
//                            Divider()
//                                .padding(.vertical)
//                        }
//
//                        if isGenerating {
//                            ProgressView("generating...")
//                                .frame(maxWidth: .infinity)
//                        }
//                    }
//                    .padding()
//                }
//
//                TextField("Placeholder", text: $text)
//                    .textFieldStyle(.roundedBorder)
//                    .padding(.horizontal)
//                    .padding(.bottom)
//                    .frame(maxHeight: .infinity, alignment: .bottom)
//                    .onSubmit {
//                        guard !text.isEmpty else { return }
//                        Task {
//                            isGenerating = true
//                            defer {
//                                isGenerating = false
//                            }
//                            let question = text
//                            text.removeAll()
//                            let response = try? await model.generateContent(question)
//                            guard let answer = response?.text else {
//                                print("response is nil.")
//                                return
//                            }
//                            withAnimation {
//                                chats.append(Chat(question: question, answer: answer))
//                            }
//                        }
//                    }
//            }
//            .navigationTitle("Q & A")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}


// ver 3.0
struct ContentView: View {
    private let model: GenerativeModel
    @State private var chat: Chat
    @State private var text = ""
    @State private var isGenerating = false

    init() {
        #warning("API Key")
        self.model = GenerativeModel(name: "gemini-pro", apiKey: "")
        self.chat = model.startChat()
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6).ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(chat.history.indices, id: \.self) { i in
                            Text(chat.history[i].role ?? "unknown")
                                .fontWeight(.semibold)
                            Text(chat.history[i].parts[0].text ?? "text is nil.")
                                .padding(.top, 5)
                            Divider()
                                .padding(.vertical)
                        }
                        if isGenerating {
                            ProgressView("generating...")
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding()
                }
                TextField("message", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .disabled(isGenerating)
                    .padding(.horizontal)
                    .padding(.bottom)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .onSubmit {
                        guard !text.isEmpty else { return }
                        Task {
                            isGenerating = true
                            defer {
                                isGenerating = false
                                text.removeAll()
                            }
                            let _ = try? await chat.sendMessage(text)
                        }
                    }
            }
            .navigationTitle("Chat with Gemini Pro")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    ContentView()
}
