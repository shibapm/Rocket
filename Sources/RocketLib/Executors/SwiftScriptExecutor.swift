import Foundation
import Logger

final class SwiftScriptExecutor: DefaultExecutor<SwiftScriptParameters> {
    lazy var fileManager: FileManager = .default
    lazy var processLauncher: ProcessLaunching = ProcessLauncher()

    override func executeStep(version: String, logger: Logger) {
        guard let scriptPath = parameters.scriptPath else {
            logger.logError("Invalid script path for the Swift script step")
            return
        }

        let supportedSwiftCPaths = ["/usr/bin/swiftc", "/home/travis/.swiftenv/shims/swiftc"]

        let swiftCPath = supportedSwiftCPaths.first { fileManager.fileExists(atPath: $0) }
        let swiftC = swiftCPath ?? "swiftc"
        let args = [
            "--driver-mode=swift",
            scriptPath,
            version,
        ]

        logger.logInfo("Running: \(swiftC) \(args.joined(separator: " "))")

        let process = Process()
        process.launchPath = swiftC
        process.arguments = args

        let standardOutput = FileHandle.standardOutput
        process.standardOutput = standardOutput
        process.standardError = standardOutput

        processLauncher.launchProcess(process: process)
    }
}

protocol ProcessLaunching {
    func launchProcess(process: Process)
}

struct ProcessLauncher: ProcessLaunching {
    func launchProcess(process: Process) {
        process.launch()
        process.waitUntilExit()
    }
}
