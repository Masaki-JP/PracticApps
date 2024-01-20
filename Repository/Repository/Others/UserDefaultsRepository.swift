import Foundation

final class UserDefaultsRepository<Item: Codable>: RepositoryProtocol {
    typealias ItemType = Item
    private let userDefaultsKey: String

    init(userDefaultsKey: String) {
        self.userDefaultsKey = userDefaultsKey
    }

    enum UserDefaultsRepositoryError: Error {
        case dataNotFound
        case decodingError
        case encodingError
    }

    func save(_ items: [Item]) throws {
        do {
            let encodedData = try JSONEncoder().encode(items)
            UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
        } catch {
            errorCall(error)
            throw UserDefaultsRepositoryError.encodingError
        }
    }

    func fetch() throws -> [Item] {
        guard let itemsData = UserDefaults.standard.data(forKey: userDefaultsKey)
        else { throw UserDefaultsRepositoryError.dataNotFound }
        do {
            let items = try JSONDecoder().decode([Item].self, from: itemsData)
            return items
        } catch {
            errorCall(error)
            throw UserDefaultsRepositoryError.decodingError
        }
    }
}
