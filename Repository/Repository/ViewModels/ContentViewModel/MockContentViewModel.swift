import Foundation

@MainActor
final class MockContentViewModel: ContentViewModelProtcol {
    private(set) var persons: [Person] = []

    init() {
        reportMockAction()
        var persons = [Person]()
        for _ in 1...10 {
            let name = "No. \(Int.random(in: 1000...9999))"
            let addtionalPerson = Person(name: name, age: Int.random(in: 10...50))
            persons.append(addtionalPerson)
        }
        self.persons = persons
    }
    
    func appendPerson(name: String) {
        reportMockAction()
        let addtionalPerson = Person(name: name, age: Int.random(in: 10...50))
        persons.append(addtionalPerson)
    }

    func removePerson(at offset: IndexSet) {
        reportMockAction()
        persons.remove(atOffsets: offset)
    }
}
