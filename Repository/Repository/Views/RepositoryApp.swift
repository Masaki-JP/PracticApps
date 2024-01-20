import SwiftUI

func errorCall(_ error: Error) {
    print("💥 \(#function)\n\(error)")
}

@main
struct RepositoryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: ContentViewModel<UserDefaultsRepository>(
                    repository: UserDefaultsRepository(userDefaultsKey: "person")
                )
            )
        }
    }
}
