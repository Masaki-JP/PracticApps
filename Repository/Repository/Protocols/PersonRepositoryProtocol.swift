import Foundation

protocol PersonRepositoryProtocol: RepositoryProtocol {
    func save(_ persons: [Person]) throws
    func fetch() throws -> [Person]
}
