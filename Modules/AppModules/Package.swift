// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "AppModules",
    defaultLocalization: "en",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "CoreUtilities", targets: ["CoreUtilities"]),
        .library(name: "CoreNetworking", targets: ["CoreNetworking"]),
        .library(name: "CorePersistence", targets: ["CorePersistence"]),
        .library(name: "CoreAnalytics", targets: ["CoreAnalytics"]),

        .library(name: "DomainProducts", targets: ["DomainProducts"]),
        .library(name: "DomainAuth", targets: ["DomainAuth"]),
        .library(name: "DomainCart", targets: ["DomainCart"]),
        .library(name: "DomainOrders", targets: ["DomainOrders"]),

        .library(name: "DataProducts", targets: ["DataProducts"]),
        .library(name: "DataAuth", targets: ["DataAuth"]),

        .library(name: "FeaturesHome", targets: ["FeaturesHome"])
        // add Search, ProductDetail, Cart, Checkout… later
    ],
    targets: [
        // CORE
        .target(
            name: "CoreUtilities",
            dependencies: [],
            path: "Sources/CoreUtilities"
        ),
        .target(
            name: "CoreNetworking",
            dependencies: ["CoreUtilities"],
            path: "Sources/CoreNetworking"
        ),
        .target(
            name: "CorePersistence",
            dependencies: ["CoreUtilities"],
            path: "Sources/CorePersistence"
        ),
        .target(
            name: "CoreAnalytics",
            dependencies: ["CoreUtilities"],
            path: "Sources/CoreAnalytics"
        ),

        // DOMAIN (independent on Core/Data)
        .target(
            name: "DomainProducts",
            dependencies: [],
            path: "Sources/DomainProducts"
        ),
        .target(
            name: "DomainAuth",
            dependencies: [],
            path: "Sources/DomainAuth"
        ),
        .target(
            name: "DomainCart",
            dependencies: [],
            path: "Sources/DomainCart"
        ),
        .target(
            name: "DomainOrders",
            dependencies: [],
            path: "Sources/DomainOrders"
        ),

        // DATA (implement repositories, depend on Domain + Core)
        .target(
            name: "DataProducts",
            dependencies: ["DomainProducts", "CoreNetworking", "CorePersistence", "CoreUtilities"],
            path: "Sources/DataProducts"
        ),
        .target(
            name: "DataAuth",
            dependencies: ["DomainAuth", "CoreNetworking", "CorePersistence", "CoreUtilities"],
            path: "Sources/DataAuth"
        ),

        // FEATURES (SwiftUI, depend on Domain; composition happens in App)
        .target(
            name: "FeaturesHome",
            dependencies: ["DomainProducts"],
            path: "Sources/FeaturesHome"
        ),

        // (create test targets when needed)
        .testTarget(
            name: "AppModulesTests",
            dependencies: ["CoreUtilities", "DomainProducts", "DataProducts", "FeaturesHome"],
            path: "Tests/AppModulesTests"
        )
    ]
)