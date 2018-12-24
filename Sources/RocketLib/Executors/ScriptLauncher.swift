import Foundation
import Logger
import ShellOut

protocol ScriptLaunching {
    var version: String { get set }

    func launchScript(withContent content: String, logger: Logger) throws
}

final class ScriptLauncher: ScriptLaunching {
    static let shared = ScriptLauncher()
    var version: String = ""

    private init() {}

    func launchScript(withContent content: String, logger _: Logger) throws {
        #if os(Linux)
            try shellOut(to: ["export VERSION=\(version)", content], outputHandle: WorkaroundFileHandler(fileDescriptor: FileHandle.standardOutput.fileDescriptor))
        #else
            try shellOut(to: ["export VERSION=\(version)", content], outputHandle: WorkaroundFileHandler())
        #endif
    }
}

final class WorkaroundFileHandler: FileHandle {
    override func write(_ data: Data) {
        guard let string = String(data: data, encoding: .utf8), !string.isEmpty else {
            return
        }

        Logger().logInfo(string)
    }

    override func closeFile() {}
}
