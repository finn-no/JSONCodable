// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "JSONCodable",                  
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "JSONCodable", targets: ["JSONCodable"])
    ],
    targets: [
        .target(name: "JSONCodable", path: "Sources")
    ],
    swiftLanguageVersions: [.v5]
)
