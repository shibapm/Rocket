import Foundation

protocol CurrentVersionProviding {
    func currentVersion() throws -> String
}

struct CurrentVersionProvider: CurrentVersionProviding {
    enum Errors: Error {
        case versionNotFound
    }

    let scriptLauncher: ScriptLaunching

    init(scriptLauncher: ScriptLaunching = ScriptLauncher()) {
        self.scriptLauncher = scriptLauncher
    }

    func currentVersion() throws -> String {
        let tags = try scriptLauncher.launchScript(withContent: "git tag --sort=-v:refname", version: nil).split(separator: "\n").lazy.map({ String($0) })

        let regex = try NSRegularExpression(pattern: "\\d.\\d.\\d", options: .caseInsensitive)

        if let version = tags.filter({ regex.firstMatch(in: $0, options: .anchored, range: NSRange(location: 0, length: $0.count)) != nil }).first {
            return version
        } else {
            throw Errors.versionNotFound
        }
    }
}
