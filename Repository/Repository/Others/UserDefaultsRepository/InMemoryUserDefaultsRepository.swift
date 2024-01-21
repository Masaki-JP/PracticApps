import Foundation

final class InMemoryUserDefaultsRepository<Item: Codable>: UserDefaultsRepositoryProtocol {
    typealias ItemType = Item

    private let dummyData: [Item]

    init(dummyData: [Item]) {
        reportMockAction()
        self.dummyData = dummyData
    }

    func save(_ items: [Item]) throws {
        reportMockAction()
    }

    func fetch() throws -> [Item] {
        reportMockAction()
        return dummyData
    }
}
