import Foundation

@MainActor
final class ContentViewModel<PRepo: RepositoryProtocol>: ContentViewModelProtcol where PRepo.ItemType == Person {
    @Published private(set) var persons: [Person] = []
    private let repository: any PersonRepositoryProtocol

    init(repository: any PersonRepositoryProtocol) {
        do {
            self.repository = repository
            self.persons = try fetchAllPersons()
        } catch {
            print("💥", error)
        }
    }

    func appendPerson(name: String) {
        do {
            let addtionalPerson = Person(name: name, age: Int.random(in: 10...50))
            var newPersons = persons
            newPersons.append(addtionalPerson)
            try savePersons(newPersons)
            persons = newPersons
        } catch {
            print("💥", error)
        }
    }

    func removePerson(at offset: IndexSet) {
        let prePersons = persons
        do {
            for i in offset {
                let removeTarget = persons[i]
                persons.removeAll { person in
                    person.id == removeTarget.id
                }
                try savePersons(self.persons)
            }
        } catch {
            persons = prePersons
            print("💥", error)
        }
    }

    private func savePersons(_ persons: [Person]) throws {
        try repository.save(persons)
    }

    private func fetchAllPersons() throws -> [Person] {
        return try repository.fetch()
    }
}
