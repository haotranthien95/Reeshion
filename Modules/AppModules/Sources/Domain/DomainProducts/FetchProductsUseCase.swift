import Foundation

public struct FetchProductsUseCase: Sendable {
    private let repo: ProductRepository
    public init(repo: ProductRepository) { self.repo = repo }
    public func callAsFunction(page: Int) async throws -> [Product] {
        try await repo.products(page: page)
    }
}
