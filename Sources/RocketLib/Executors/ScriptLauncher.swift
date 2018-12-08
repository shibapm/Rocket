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

    func launchScript(withContent content: String, logger: Logger) throws {
        #if os(Linux)
            let output = try shellOut(to: ["export VERSION=\(version)", content])
            logger.logInfo(output)
        #else
            try shellOut(to: ["export VERSION=\(version)", content], outputHandle: WorkaroundFileHandler())
        #endif
    }
}

final class WorkaroundFileHandler: FileHandle {
    override func write(_ data: Data) {
        FileHandle.standardOutput.write(data)
    }

    override func closeFile() {}
}
