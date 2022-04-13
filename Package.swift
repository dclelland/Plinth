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
    targets: [
        .target(name: "QRIMatrix", dependencies: [])
    ]
)
