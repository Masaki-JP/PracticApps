import Foundation

final class UserDefaultsPersonRepository: PersonRepositoryProtocol {
    private let userDefaultsKey = "person"

    enum UserDefaultsPersonRepositoryError: Error {
        case dataNotFound
        case decodingError
        case encodingError
    }
    
    func save(_ persons: [Person]) throws {
        do {
            let encodedData = try JSONEncoder().encode(persons)
            UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
        } catch {
            print("💥", error)
            throw UserDefaultsPersonRepositoryError.encodingError
        }
    }

    func fetch() throws -> [Person] {
        guard let personData = UserDefaults.standard.data(forKey: userDefaultsKey)
        else { throw UserDefaultsPersonRepositoryError.dataNotFound }
        do {
            let persons = try JSONDecoder().decode([Person].self, from: personData)
            return persons
        } catch {
            print("💥", error)
            throw UserDefaultsPersonRepositoryError.decodingError
        }
    }
}
