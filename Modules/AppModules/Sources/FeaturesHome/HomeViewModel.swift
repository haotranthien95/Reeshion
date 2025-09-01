import Foundation
import DomainProducts

@MainActor
public final class HomeViewModel: ObservableObject {
    @Published public private(set) var items: [Product] = []
    @Published public private(set) var isLoading = false
    private let fetchProducts: FetchProductsUseCase

    public init(fetchProducts: FetchProductsUseCase) {
        self.fetchProducts = fetchProducts
    }

    public func loadFirstPage() async {
        guard !isLoading else { return }
        isLoading = true
        defer { isLoading = false }
        do {
            items = try await fetchProducts(page: 1)
        } catch {
            // TODO: handle error (hiển thị state lỗi)
        }
    }
}
