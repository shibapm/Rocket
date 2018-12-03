import Logger
import Nimble
@testable import RocketLib
import TestSpy
import XCTest

final class HideDevDependenciesExecutorTests: XCTestCase {
    func testItSendsTheHideDependenciesCallToTheDevDependenciesModifier() {
        checkDevDependencyModifierReceived(dictionary: ["package_path": "testPackage.swift"], expectedPackagePath: "testPackage.swift")
    }

    func testItUsesTheDefaultPackagePath() {
        checkDevDependencyModifierReceived(dictionary: nil, expectedPackagePath: "Package.swift")
    }

    func checkDevDependencyModifierReceived(dictionary: [String: Any]?, expectedPackagePath: String) {
        let devDependenciesModifier = SpyDevDependenciesModifier()
        let executor = HideDevDependenciesExecutor(dictionary: dictionary)
        executor.devDependenciesModifier = devDependenciesModifier
        executor.executeStep(version: "1.0.0", logger: Logger.testLogger)

        expect(devDependenciesModifier).to(haveReceived(.hideDependencies(packagePath: expectedPackagePath)))
    }
}
