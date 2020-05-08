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

extension ScriptLaunching {
    @discardableResult
    func launchScript(withContent content: String) throws -> String {
        try launchScript(withContent: content, version: nil)
    }
}

struct ScriptLauncher: ScriptLaunching {
    func launchScript(withContent content: String, version: String?) throws -> String {
        var runnableContent: String

        if let version = version {
            runnableContent = "export VERSION=\(version) && \(content)"
        } else {
            runnableContent = content
        }

        let output = run(bash: runnableContent)

        if output.exitcode != 0 {
            throw ScriptLauncherError(errorString: output.stdout)
        } else {
            return output.stdout
        }
    }
}
