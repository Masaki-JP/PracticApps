import SwiftUI
import PDFKit

enum PDF {
    static let single = "Single PDF"
    static let multiple = "Multiple PDF"
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach([PDF.single, PDF.multiple], id: \.self) { fileName  in
                        NavigationLink(fileName) {
                            Image(fileName)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                } header: {
                    Text("Use Image Instance")
                        .textCase(.none)
                }
                Section {
                    ForEach([PDF.single, PDF.multiple], id: \.self) { fileName in
                        NavigationLink(fileName + " (Vertical)") {
                            PDFKitView1_Vertical(urlString: fileName)
                                .navigationTitle("Vertical")
                                .navigationBarTitleDisplayMode(.inline)
                        }
                        NavigationLink(fileName + " (Horizontal)") {
                            PDFKitView1_Horizontal(urlString: fileName)
                                .navigationTitle("Horizontal")
                                .navigationBarTitleDisplayMode(.inline)
                        }
                    }
                } header: {
                    Text("Use PDFKitView1 Instance")
                        .textCase(.none)
                }
                Section {
                    ForEach([PDF.single, PDF.multiple], id: \.self) { fileName in
                        NavigationLink(fileName) {
                            PDFViewer(fileName: fileName)
                        }
                    }
                } header: {
                    Text("Use PDFKitView2 Instance")
                        .textCase(.none)
                }
            }
            .navigationTitle("Documents")
        }
    }
}

struct PDFKitView1_Vertical: UIViewRepresentable {
    private let url: URL

    init(urlString: String) {
        self.url = Bundle.main.url(forResource: urlString, withExtension: "pdf")!
    }

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: url)
        pdfView.autoScales = true
        pdfView.displayDirection = .vertical // default
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {}
}

struct PDFKitView1_Horizontal: UIViewRepresentable {
    private let url: URL

    init(urlString: String) {
        self.url = Bundle.main.url(forResource: urlString, withExtension: "pdf")!
    }

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: url)
        pdfView.autoScales = true
        pdfView.displayDirection = .horizontal
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {}
}

struct PDFViewer: View {
    @State private var currentPageIndex = 0
    private let document: PDFDocument?

    init(fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "pdf"), let document = PDFDocument(url: url) else {
            self.document = nil
            return
        }
        self.document = document
    }

    var body: some View {
        VStack {
            if let document = self.document {
                PDFKitView2(
                    document: document,
                    currentPageIndex: $currentPageIndex
                )
            } else {
                Text("エラーが発生しました。")
                    .font(.largeTitle.bold())
            }
        }
        .sensoryFeedback(.success, trigger: currentPageIndex)
        .padding(.bottom, 100)
        .overlay(alignment: .bottom) {
            if let document {
                HStack {
                    Button(action: {
                        currentPageIndex -= 1
                    }, label: {
                        Image(systemName: "arrowshape.backward.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .scaledToFit()
                    })
                    .disabled(!(currentPageIndex > 0))
                    Spacer().frame(width: 30)
                    Button(action: {
                        currentPageIndex += 1
                    }, label: {
                        Image(systemName: "arrowshape.forward.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .scaledToFit()
                    })
                    .disabled(!(currentPageIndex < document.pageCount-1))
                }
            }
        }
    }
}

struct PDFKitView2: UIViewRepresentable {
    let document: PDFDocument
    @Binding var currentPageIndex: Int

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = self.document
        pdfView.autoScales = true
        pdfView.displayMode = .singlePage
        pdfView.backgroundColor = .clear
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        guard let document = uiView.document,
              currentPageIndex >= 0,
              currentPageIndex < document.pageCount,
              let page = document.page(at: currentPageIndex)
        else { fatalError() }
        uiView.go(to: page)
    }
}

#Preview {
    ContentView()
}
