import Foundation
import Logger
import SwiftShell

struct ScriptLauncherError: Error {
    let errorString: String
}

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

        let outputs = contents.map { run(bash: $0) }
        if let errorString = outputs.lazy.filter({ $0.stderror.count > 0 }).map({ $0.stderror }).first {
            throw ScriptLauncherError(errorString: errorString)
        }
    }
}
