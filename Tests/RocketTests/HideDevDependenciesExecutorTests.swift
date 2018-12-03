import XCTest
@testable import RocketLib
import Logger
import Nimble
import TestSpy

final class HideDevDependenciesExecutorTests: XCTestCase {
    func testItSendsTheHideDependenciesCallToTheDevDependenciesModifier() {
        checkDevDependencyModifierReceived(dictionary: ["package_path": "testPackage.swift"], expectedPackagePath: "testPackage.swift")
    }
    
    func testItUsesTheDefaultPackagePath() {
        checkDevDependencyModifierReceived(dictionary: nil, expectedPackagePath: "Package.swift")
    }
    
    func checkDevDependencyModifierReceived(dictionary: [String:Any]?, expectedPackagePath: String) {
        let devDependenciesModifier = SpyDevDependenciesModifier()
        let executor = HideDevDependenciesExecutor(dictionary: dictionary)
        executor.devDependenciesModifier = devDependenciesModifier
        executor.executeStep(version: "1.0.0", logger: Logger.testLogger)
        
        expect(devDependenciesModifier).to(haveReceived(.hideDependencies(packagePath: expectedPackagePath)))
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
