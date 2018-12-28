// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Rocket",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .executable(
            name: "rocket",
            targets: ["Rocket"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/jpsim/Yams", from: "1.0.0"),
        .package(url: "https://github.com/f-meloni/Logger", from: "0.1.0"),
        .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.1.0"),
        .package(url: "https://github.com/orta/PackageConfig.git", from: "0.0.1"),
        // Dev Dependencies for testing.setup
        .package(url: "https://github.com/Quick/Nimble", from: "7.3.1"), // dev
        .package(url: "https://github.com/f-meloni/TestSpy", from: "0.3.1"), // dev
        .package(url: "https://github.com/orta/Komondor.git", from: "1.0.0"), // dev
        .package(url: "https://github.com/nicklockwood/SwiftFormat.git", from: "0.35.8"), // dev
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "RocketLib",
            dependencies: ["Logger", "ShellOut"]
        ),
        .target(
            name: "Rocket",
            dependencies: ["Yams", "Logger", "PackageConfig", "RocketLib"]
        ),
        .testTarget(
            name: "RocketTests",
            dependencies: ["RocketLib", "Nimble", "TestSpy"]
        ),
    ]
)

#if canImport(PackageConfig)
    import PackageConfig

    let config = PackageConfig([
        "komondor": [
            "pre-commit": [
                "swift run swiftformat .",
                "git add .",
            ],
        ],
    ])
#endif
