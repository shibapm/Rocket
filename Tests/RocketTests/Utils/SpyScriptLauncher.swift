import Logger
@testable import RocketLib
import TestSpy

final class SpyScriptLauncher: ScriptLaunching, TestSpy {
    enum Method: Equatable {
        case launchScript(content: String, version: String?)
    }

    var callstack = CallstackContainer<Method>()

    func launchScript(withContent content: String, version: String?, logger _: Logger) throws {
        callstack.record(.launchScript(content: content, version: version))
    }
}
