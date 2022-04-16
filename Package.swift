// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Plinth",
    platforms: [
        .macOS(.v12),
        .iOS(.v13)
    ],
    products: [
        .library(name: "Plinth", targets: ["Plinth"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-numerics", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "Plinth",
            dependencies: [
                .product(name: "Numerics", package: "swift-numerics")
            ]
        )
    ]
)
