import Logger
import Nimble
@testable import RocketLib
import XCTest

final class SwiftScriptExecutorTests: XCTestCase {
    func testItCreatesTheCorrectProcess() {
        let testPath = "TestPath.swift"
        let executor = SwiftScriptExecutor(dictionary: ["script_path": testPath])

        executor.fileManager = DummyFileManager()
        let processLauncher = SpyProcessLauncher()
        executor.processLauncher = processLauncher

        executor.executeStep(version: "1.0.0", logger: Logger.testLogger)

        expect(processLauncher.receivedProcess?.launchPath) == "/usr/bin/swiftc"
        expect(processLauncher.receivedProcess?.arguments) == [
            "--driver-mode=swift",
            testPath,
            "1.0.0",
        ]
    }

    func testItDoesntCreateTheProcessIfThereIsNoScriptPath() {
        let executor = SwiftScriptExecutor(dictionary: nil)
        let processLauncher = SpyProcessLauncher()
        executor.processLauncher = processLauncher

        executor.executeStep(version: "1.0.0", logger: Logger.testLogger)

        expect(processLauncher.receivedProcess?.launchPath).to(beNil())
    }
}

fileprivate class DummyFileManager: FileManager {
    override func fileExists(atPath _: String) -> Bool {
        return true
    }
}

fileprivate class SpyProcessLauncher: ProcessLaunching {
    var receivedProcess: Process?

    func launchProcess(process: Process) {
        receivedProcess = process
    }
}
