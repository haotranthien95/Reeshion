import Foundation
import CoreUtilities

public protocol NetworkClient: Sendable {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

public final class URLSessionNetworkClient: NetworkClient {
    private let session: URLSession
    public init(configuration: URLSessionConfiguration = .default) {
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = 60
        self.session = URLSession(configuration: configuration)
    }
    public func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        AppLog.info("➡️ \(request.httpMethod ?? "GET") \(request.url?.absoluteString ?? "")")
        return try await session.data(for: request)
    }
}

public struct Endpoint {
    public let path: String
    public var query: [URLQueryItem] = []
    public var method: String = "GET"
    public init(path: String, query: [URLQueryItem] = [], method: String = "GET") {
        self.path = path; self.query = query; self.method = method
    }
    public func urlRequest(baseURL: URL) -> URLRequest {
        var comps = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)!
        if !query.isEmpty { comps.queryItems = query }
        var req = URLRequest(url: comps.url!)
        req.httpMethod = method
        return req
    }
}
