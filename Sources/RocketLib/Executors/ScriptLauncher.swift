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
        let handler = workaroundFileHandler()

        try shellOut(to: ["export VERSION=\(version)", content], outputHandle: handler)
    }

    private func workaroundFileHandler() -> WorkaroundFileHandler? {
        #if os(Linux)
            return WorkaroundFileHandler(fileDescriptor: FileHandle.standardOutput.fileDescriptor, closeOnDealloc: false)
        #else
            return WorkaroundFileHandler()
        #endif
    }
}

final class WorkaroundFileHandler: FileHandle {
    override func write(_ data: Data) {
        FileHandle.standardOutput.write(data)
    }

    override func closeFile() {}
}
