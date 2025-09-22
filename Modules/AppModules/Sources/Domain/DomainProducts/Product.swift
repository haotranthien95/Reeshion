import Foundation

public struct Product: Identifiable, Equatable, Sendable, Codable {
    public let id: String
    public let name: String
    public let price: Decimal
    public let imageURL: URL?
    public init(id: String, name: String, price: Decimal, imageURL: URL?) {
        self.id = id; self.name = name; self.price = price; self.imageURL = imageURL
    }
}
