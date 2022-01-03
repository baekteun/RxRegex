// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RxRegex",
    platforms: [
        .iOS(.v9), .tvOS(.v9)
    ],
    products: [
        .library(
            name: "RxRegex",
            targets: ["RxRegex"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.2.0"))
    ],
    targets: [
        .target(
            name: "RxRegex",
            dependencies: ["RxSwift"]),
        .testTarget(
            name: "RxRegexTests",
            dependencies: ["RxRegex"]),
    ]
)
