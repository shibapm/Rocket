@testable import RocketLib
import TestSpy

final class SpyScriptLauncher: ScriptLaunching, TestSpy {
    enum Method: Equatable {
        case launchScript(content: String)
    }

    var callstack = CallstackContainer<Method>()
    
    func launchScript(withContent content: String) throws {
        callstack.record(.launchScript(content: content))
    }
}
