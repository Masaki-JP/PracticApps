import SwiftUI

func errorPrint(
    _ error: Error,
    file: String = #file,
    function: String = #function,
    line: Int = #line
) {
    print("💥💥💥")
    print("error: \(error) (\(type(of: error)))")
    print("function: \(function)")
    print("line: \(line)")
    print("file: \(file)")
    print("💥💥💥")
}

@main
struct RepositoryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: ContentViewModel(
                    repository: UserDefaultsRepository(userDefaultsKey: "person")
                )
            )
        }
    }
}
