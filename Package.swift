// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QRIMatrix",
    platforms: [
        .macOS(.v12),
        .iOS(.v13)
    ],
    products: [
        .library(name: "QRIMatrix", targets: ["QRIMatrix"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-numerics", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "QRIMatrix",
            dependencies: [
                .product(name: "Numerics", package: "swift-numerics")
            ]
        )
    ]
)
