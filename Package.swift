// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LCActivityIndicator",
    platforms: [
        .macOS(.v13), .iOS(.v16)
    ],
    
    products: [
        .library(
            name: "LCActivityIndicator",
            targets: ["LCActivityIndicator"]),
    ],
    targets: [
        .target(
            name: "LCActivityIndicator"),
        .testTarget(
            name: "LCActivityIndicatorTests",
            dependencies: ["LCActivityIndicator"]),
    ]
)
