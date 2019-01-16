import Foundation
import Logger
import ShellOut

protocol ScriptLaunching {
    func launchScript(withContent content: String, version: String?, logger: Logger) throws
}

final class ScriptLauncher: ScriptLaunching {
    init() {}

    func launchScript(withContent content: String, version: String?, logger _: Logger) throws {
        var contents: [String] = []

        if let version = version {
            contents.append("export VERSION=\(version)")
        }

        contents.append(content)

        try shellOut(to: contents)
    }
}
