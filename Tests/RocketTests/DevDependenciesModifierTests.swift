import Nimble
@testable import RocketLib
import XCTest

final class DevDependenciesModifierTests: XCTestCase {
    var devDependencyModifier: DevDependenciesModifier!

    let testPath = "testPackage.swift"

    override func setUp() {
        super.setUp()
        devDependencyModifier = DevDependenciesModifier()
    }

    override func tearDown() {
        try? FileManager.default.removeItem(atPath: testPath)
        super.tearDown()
    }

    func testItHidesTheDependenciesCorrectly() throws {
        try givenAPackage(content: devDependencyPackage)
        devDependencyModifier = DevDependenciesModifier()
        try devDependencyModifier.hideDependencies(packagePath: testPath)
        expect(try String(contentsOfFile: self.testPath)) == hiddenDevDependencyPackage
    }

    func testItShowsTheDependenciesCorrectly() throws {
        try givenAPackage(content: hiddenDevDependencyPackage)
        devDependencyModifier = DevDependenciesModifier()
        try devDependencyModifier.unhideDependencies(packagePath: testPath)
        expect(try String(contentsOfFile: self.testPath)) == devDependencyPackage
    }

    private func givenAPackage(content: String) throws {
        try content.write(toFile: testPath, atomically: false, encoding: .utf8)
    }

    private var devDependencyPackage: String {
        return """
        // swift-tools-version:4.2
        import PackageDescription

        // Version number can be found in Source/Danger/Danger.swift
        let package = Package(
        name: "danger-swift",
        products: [
            .library(name: "Danger", type: .dynamic, targets: ["Danger"]),
            .executable(name: "danger-swift", targets: ["Runner"]),
        ],
        dependencies: [
            .package(url: "https://github.com/f-meloni/Logger", from: "0.1.0"),
            .package(url: "https://github.com/JohnSundell/Marathon.git", from: "3.1.0"),
            .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.1.0"),
            .package(url: "https://github.com/nerdishbynature/octokit.swift", from: "0.9.0"),
            // Dev dependencies
            .package(url: "https://github.com/eneko/SourceDocs.git", from: "0.5.1"), // dev
            .package(url: "https://github.com/orta/Komondor.git", from: "1.0.0"), //dev
            .package(url: "https://github.com/nicklockwood/SwiftFormat.git", from: "0.35.8"), // dev
            .package(url: "https://github.com/Realm/SwiftLint.git", from: "0.28.1"), // dev
        ],
        targets: [
            .target(name: "Danger", dependencies: ["ShellOut", "OctoKit", "Logger"]),
            .target(name: "RunnerLib", dependencies: ["Logger", "ShellOut"]),
            .target(name: "Runner", dependencies: ["RunnerLib", "MarathonCore", "Logger"]),
            .testTarget(name: "DangerTests", dependencies: ["Danger"]),
            .testTarget(name: "RunnerLibTests", dependencies: ["RunnerLib"]),
        ]
        )
        """
    }

    private var hiddenDevDependencyPackage: String {
        return """
        // swift-tools-version:4.2
        import PackageDescription

        // Version number can be found in Source/Danger/Danger.swift
        let package = Package(
        name: "danger-swift",
        products: [
            .library(name: "Danger", type: .dynamic, targets: ["Danger"]),
            .executable(name: "danger-swift", targets: ["Runner"]),
        ],
        dependencies: [
            .package(url: "https://github.com/f-meloni/Logger", from: "0.1.0"),
            .package(url: "https://github.com/JohnSundell/Marathon.git", from: "3.1.0"),
            .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.1.0"),
            .package(url: "https://github.com/nerdishbynature/octokit.swift", from: "0.9.0"),
            // Dev dependencies
        //    .package(url: "https://github.com/eneko/SourceDocs.git", from: "0.5.1"), // dev
        //    .package(url: "https://github.com/orta/Komondor.git", from: "1.0.0"), //dev
        //    .package(url: "https://github.com/nicklockwood/SwiftFormat.git", from: "0.35.8"), // dev
        //    .package(url: "https://github.com/Realm/SwiftLint.git", from: "0.28.1"), // dev
        ],
        targets: [
            .target(name: "Danger", dependencies: ["ShellOut", "OctoKit", "Logger"]),
            .target(name: "RunnerLib", dependencies: ["Logger", "ShellOut"]),
            .target(name: "Runner", dependencies: ["RunnerLib", "MarathonCore", "Logger"]),
            .testTarget(name: "DangerTests", dependencies: ["Danger"]),
            .testTarget(name: "RunnerLibTests", dependencies: ["RunnerLib"]),
        ]
        )
        """
    }
}
