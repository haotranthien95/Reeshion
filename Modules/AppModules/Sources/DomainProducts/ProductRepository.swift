import Foundation

public protocol ProductRepository:Sendable {
    func products(page: Int) async throws -> [Product]
    func productDetail(id: String) async throws -> Product
}
