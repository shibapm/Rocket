@testable import RocketLib
import ShellOut
import TestSpy

final class SpyScriptLauncher: ScriptLaunching, TestSpy {
    var version: String = ""

    enum Method: Equatable {
        case launchScript(content: String)
    }

    var callstack = CallstackContainer<Method>()

    func launchScript(withContent content: String) throws {
        callstack.record(.launchScript(content: content))
    }
}

extension ShellOutCommand: Equatable {
    public static func == (lhs: ShellOutCommand, rhs: ShellOutCommand) -> Bool {
        return lhs.string == rhs.string
    }
}
