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

        let supportedSwiftPaths = ["/usr/bin/swift", "/home/travis/.swiftenv/shims/swift"]

        let swiftPath = supportedSwiftPaths.first { fileManager.fileExists(atPath: $0) }
        let swift = swiftPath ?? "swift"
        let args = [
            scriptPath,
            version,
        ] + parameters.arguments

        logger.logInfo("Running: \(swift) \(args.joined(separator: " "))")

        let process = Process()
        process.launchPath = swift
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
