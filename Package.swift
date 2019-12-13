// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JSONCodable",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_10),
        .tvOS(.v11),
        .watchOS(.v4)
    ],
    products: [
        .library(name: "JSONCodable", targets: ["JSONCodable"])
    ],
    targets: [
        .target(name: "JSONCodable", dependencies: []),
        .testTarget(name: "JSONCodableTests", dependencies: ["JSONCodable"])
    ]
)
