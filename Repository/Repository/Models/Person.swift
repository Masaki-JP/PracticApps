import Foundation

struct Person: Codable, Identifiable {
    let name: String
    let age: Int
    let id: UUID

    init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.id = UUID()
    }
}
