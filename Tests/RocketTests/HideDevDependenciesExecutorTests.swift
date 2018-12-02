import XCTest
@testable import RocketLib
import Logger
import Nimble
import TestSpy

final class HideDevDependenciesExecutorTests: XCTestCase {
    func testItSendsTheHideDependenciesCallToTheDevDependenciesModifier() {
        let devDependenciesModifier = SpyDevDependenciesModifier()
        let executor = HideDevDependenciesExecutor(dictionary: ["package_path": "testPackage.swift"])
        executor.devDependenciesModifier = devDependenciesModifier
        executor.executeStep(version: "1.0.0", logger: Logger.testLogger)
        
        expect(devDependenciesModifier).to(haveReceived(.hideDependencies(packagePath: "testPackage.swift")))
    }
    
    func testItUsesTheDefaultPackagePath() {
        let devDependenciesModifier = SpyDevDependenciesModifier()
        let executor = HideDevDependenciesExecutor(dictionary: nil)
        executor.devDependenciesModifier = devDependenciesModifier
        executor.executeStep(version: "1.0.0", logger: Logger.testLogger)
        
        expect(devDependenciesModifier).to(haveReceived(.hideDependencies(packagePath: "Package.swift")))
    }
}

final class SpyDevDependenciesModifier: DevDependenciesModifing, TestSpy {
    enum Method: Equatable {
        case hideDependencies(packagePath: String)
        case unhideDependencies(packagePath: String)
    }
    
    var callstack = CallstackContainer<Method>()
    
    func hideDependencies(packagePath: String) throws {
        callstack.record(.hideDependencies(packagePath: packagePath))
    }
    
    func unhideDependencies(packagePath: String) throws {
        callstack.record(.unhideDependencies(packagePath: packagePath))
    }
}
