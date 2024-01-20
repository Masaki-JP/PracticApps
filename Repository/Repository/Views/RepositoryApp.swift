import SwiftUI

@main
struct RepositoryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: ContentViewModel<UserDefaultsRepository>(
                    repository: UserDefaultsPersonRepository()
                )
            )
        }
    }
}
