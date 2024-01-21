import SwiftUI

struct ContentView<ViewModel: ContentViewModelProtcol>: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.persons) { person in
                    let text = "\(person.name) (\(person.age.description))"
                    Text(text)
                }
                .onDelete { viewModel.removePerson(at: $0) }
            }
            .navigationTitle("Persons")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("追加") {
                        let num = Int.random(in: 1000...9999)
                        viewModel.appendPerson(name: "No. \(num)")
                    }
                }
            }
        }
    }
}



#Preview {
    ContentView(
        viewModel: ContentViewModel<UserDefaultsRepository>(
            repository: UserDefaultsRepository(userDefaultsKey: "person")
        )
    )
}
