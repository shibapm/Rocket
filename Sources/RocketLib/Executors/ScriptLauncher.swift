import Foundation
import Logger
import SwiftShell

struct ScriptLauncherError: Error {
    let errorString: String
}

protocol ScriptLaunching {
    @discardableResult
    func launchScript(withContent content: String, version: String?) throws -> String
}

struct ScriptLauncher: ScriptLaunching {
    func launchScript(withContent content: String, version: String?) throws -> String {
        var contents: [String] = []

        if let version = version {
            contents.append("export VERSION=\(version)")
        }

        contents.append(content)

        let outputs = contents.map { run(bash: $0) }
        if let errorString = outputs.lazy.filter({ $0.exitcode != 0 }).map({ $0.stderror }).first {
            throw ScriptLauncherError(errorString: errorString)
        } else {
            return outputs.last?.stdout ?? ""
        }
    }
}
