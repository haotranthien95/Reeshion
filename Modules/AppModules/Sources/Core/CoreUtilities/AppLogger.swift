import Foundation
import os

public enum AppLog {
    private static let logger = Logger(subsystem: "vn.reetro.reeshion", category: "app")
    public static func info(_ message: String) { logger.info("\(message, privacy: .public)") }
    public static func error(_ message: String) { logger.error("\(message, privacy: .public)") }
}
