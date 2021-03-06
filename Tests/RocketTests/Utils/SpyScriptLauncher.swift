import Logger
@testable import RocketLib
import TestSpy

final class SpyScriptLauncher: ScriptLaunching, TestSpy {
    enum Method: Equatable {
        case launchScript(content: String, version: String?)
    }

    var callstack = CallstackContainer<Method>()
    var result = ""

    func launchScript(withContent content: String, version: String?) throws -> String {
        callstack.record(.launchScript(content: content, version: version))
        return result
    }
}
