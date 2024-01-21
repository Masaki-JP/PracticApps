import Foundation

@MainActor
protocol ContentViewModelProtcol: ObservableObject {
    var persons: [Person] { get }
    func appendPerson(name: String)
    func removePerson(at offset: IndexSet)
}
