import SwiftUI

func reportError(
    fileID: String = #fileID,
    function: String = #function,
    line: Int = #line,
    _ error: Error
) {
    print("💥💥💥")
    print("fileID: \(fileID)")
    print("function: \(function)")
    print("line: \(line)")
    print("error: \(error) (\(type(of: error)))")
    print("💥💥💥")
}

func reportMockAction(
    fileID: String = #fileID,
    function: String = #function,
    line: Int = #line
) {
    print("")
    print("Called MockAction")
    print("function: \(function)")
    print("line: \(line)")
    print("fileID: \(fileID)")
    print("")
}

@main
struct RepositoryApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView(
//                viewModel: ContentViewModel(
//                    repository: UserDefaultsRepository(userDefaultsKey: "person")
//                )
//            )

            ContentView(
                viewModel: ContentViewModel(
                    repository: InMemoryUserDefaultsRepository(
                        dummyData: [
                            .init(name: "Naruto", age: 17),
                            .init(name: "Sasuke", age: 17),
                            .init(name: "Sakura", age: 17),
                            .init(name: "Kakashi", age: 31),
                        ]
                    )
                )
            )

//            ContentView(viewModel: MockContentViewModel())
        }
    }
}
