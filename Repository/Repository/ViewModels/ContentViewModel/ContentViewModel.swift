import Foundation

@MainActor
final class ContentViewModel<PersonRepository: RepositoryProtocol>: ContentViewModelProtcol where PersonRepository.ItemType == Person {
    @Published private(set) var persons: [Person] = []
    private let personRepository: PersonRepository

    init(repository: PersonRepository) {
        do {
            self.personRepository = repository
            self.persons = try fetchAllPersons()
        } catch {
            reportError(error)
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
            reportError(error)
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
            reportError(error)
        }
    }

    private func savePersons(_ persons: [Person]) throws {
        try personRepository.save(persons)
    }

    private func fetchAllPersons() throws -> [Person] {
        return try personRepository.fetch()
    }
}
