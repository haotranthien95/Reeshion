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
        .library(name: "CoreTheme", targets: ["CoreTheme"]),

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
            path: "Sources/Core/CoreUtilities"
        ),
        .target(
            name: "CoreTheme",
            dependencies: [],
            path: "Sources/Core/CoreTheme"
        ),
        .target(
            name: "CoreNetworking",
            dependencies: ["CoreUtilities"],
            path: "Sources/Core/CoreNetworking"
        ),
        .target(
            name: "CorePersistence",
            dependencies: ["CoreUtilities"],
            path: "Sources/Core/CorePersistence"
        ),
        .target(
            name: "CoreAnalytics",
            dependencies: ["CoreUtilities"],
            path: "Sources/Core/CoreAnalytics"
        ),

        // DOMAIN (independent on Core/Data)
        .target(
            name: "DomainProducts",
            dependencies: [],
            path: "Sources/Domain/DomainProducts"
        ),
        .target(
            name: "DomainAuth",
            dependencies: [],
            path: "Sources/Domain/DomainAuth"
        ),
        .target(
            name: "DomainCart",
            dependencies: [],
            path: "Sources/Domain/DomainCart"
        ),
        .target(
            name: "DomainOrders",
            dependencies: [],
            path: "Sources/Domain/DomainOrders"
        ),

        // DATA (implement repositories, depend on Domain + Core)
        .target(
            name: "DataProducts",
            dependencies: ["DomainProducts", "CoreNetworking", "CorePersistence", "CoreUtilities"],
            path: "Sources/Data/DataProducts"
        ),
        .target(
            name: "DataAuth",
            dependencies: ["DomainAuth", "CoreNetworking", "CorePersistence", "CoreUtilities"],
            path: "Sources/Data/DataAuth"
        ),

        // FEATURES (SwiftUI, depend on Domain; composition happens in App)
        .target(
            name: "FeaturesHome",
            dependencies: ["DomainProducts", "CoreTheme"],
            path: "Sources/Feature/FeaturesHome"
        ),

        // (create test targets when needed)
        .testTarget(
            name: "AppModulesTests",
            dependencies: ["CoreUtilities", "DomainProducts", "DataProducts", "FeaturesHome"],
            path: "Tests/AppModulesTests"
        )
    ]
)
