import Foundation
import DomainProducts
import CoreNetworking
import CoreUtilities

public final class ProductsRepositoryImpl: ProductRepository {
    private let baseURL: URL
    private let client: NetworkClient

    public init(baseURL: URL, client: NetworkClient) {
        self.baseURL = baseURL; self.client = client
    }

    public func products(page: Int) async throws -> [Product] {
//        // Demo request (placeholder). Bạn sẽ thay bằng API thực tế.
//        let endpoint = Endpoint(path: "products", query: [URLQueryItem(name: "page", value: "\(page)")])
//        let req = endpoint.urlRequest(baseURL: baseURL)
//        let (data, _) = try await client.data(for: req)
//
//        struct APIProduct: Decodable { let id: String; let name: String; let price: Double; let image: String? }
//        let decoded = try JSONDecoder().decode([APIProduct].self, from: data)
//        return decoded.map { api in
//            Product(id: api.id, name: api.name, price: Decimal(api.price), imageURL: api.image.flatMap(URL.init(string:)) )
//        }
        return [Product(id: "1121", name: "Quần Kaki Dancer", price: 200000, imageURL:URL(string:"https://reetro.vn/wp-content/uploads/2024/12/vn-11134208-7ras8-m1idl8t8uenz9b.jpg"))]
    }

    public func productDetail(id: String) async throws -> Product {
        let endpoint = Endpoint(path: "products/\(id)")
        let req = endpoint.urlRequest(baseURL: baseURL)
        let (data, _) = try await client.data(for: req)

        struct APIProduct: Decodable { let id: String; let name: String; let price: Double; let image: String? }
        let api = try JSONDecoder().decode(APIProduct.self, from: data)
        return Product(id: api.id, name: api.name, price: Decimal(api.price), imageURL: api.image.flatMap(URL.init(string:)) )
    }
}
