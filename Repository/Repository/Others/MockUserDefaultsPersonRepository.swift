import Foundation

final class MockUserDefaultsPersonRepository: PersonRepositoryProtocol {

    enum DummyUserDefaultsPersonRepositoryError: Error {
        case dataNotFound
        case decodingError
        case encodingError
    }

    func save(_ persons: [Person]) throws {
        print("Mock save function called.")
    }

    func fetch() throws -> [Person] {
        print("Mock fetchAllPersons called.")
        let persons: [Person] = [
            .init(name: "Naruto", age: 17),
            .init(name: "Sasuke", age: 17),
            .init(name: "Sakura", age: 17),
            .init(name: "Kakashi", age: 31),
        ]
        return persons
    }
}
