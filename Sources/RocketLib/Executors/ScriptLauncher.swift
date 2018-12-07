import Foundation
import Logger
import ShellOut

protocol ScriptLaunching {
    var version: String { get set }

    func launchScript(withContent content: String) throws
}

final class ScriptLauncher: ScriptLaunching {
    static let shared = ScriptLauncher()
    var version: String = ""

    private init() {}

    func launchScript(withContent content: String) throws {
        let handler = WorkaroundFileHandler()

        try shellOut(to: ["export VERSION=\(version)", content], outputHandle: handler)
    }
}

final class WorkaroundFileHandler: FileHandle {
    override func write(_ data: Data) {
        FileHandle.standardOutput.write(data)
    }

    override func closeFile() {}
}
