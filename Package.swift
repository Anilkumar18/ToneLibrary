// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ToneLibrary",
    platforms: [
        .iOS(.v14), .macOS(.v11)
    ],
    products: [
        .library(
            name: "ToneLibrary",
            targets: ["ToneListenWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AudioKit/AudioKit.git", .exactItem("5.3.0")),
        .package(url: "https://github.com/malcommac/SwiftLocation", .exactItem("5.1.0"))
    ],
    targets: [
        .target(
                    name: "ToneListenWrapper",
                    dependencies: [
                        .product(name: "AudioKit", package: "AudioKit"),
                        .product(name: "SwiftLocation", package: "SwiftLocation"),
                        "ToneListen"
                    ],
                    path: "Sources/Wrapper",
                    publicHeadersPath: ""
               ),
        .binaryTarget(name: "ToneListen", path: "./Sources/ToneListen.xcframework")
    ]
)
