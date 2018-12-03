@testable import RocketLib
import TestSpy

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
