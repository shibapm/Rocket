import Logger
import Nimble
@testable import RocketLib
import XCTest

final class SwiftScriptExecutorTests: XCTestCase {
    private let testPath = "TestPath.swift"

    func testItCreatesTheCorrectProcess() {
        let executor = SwiftScriptExecutor(step: .swiftScript, dictionary: ["script_path": testPath])

        executor.fileManager = StubbedFileManager()
        let processLauncher = SpyProcessLauncher()
        executor.processLauncher = processLauncher

        executor.executeStep(version: "1.0.0", logger: Logger.testLogger)

        expect(processLauncher.receivedProcess?.launchPath) == "/usr/bin/swift"
        expect(processLauncher.receivedProcess?.arguments) == [
            testPath,
            "1.0.0",
        ]
    }

    func testItPassesTheArgumentsToTheProcess() {
        let arguments = ["test1", "test2", "test3"]
        let executor = SwiftScriptExecutor(step: .swiftScript, dictionary: ["script_path": testPath, "arguments": arguments])

        executor.fileManager = StubbedFileManager()
        let processLauncher = SpyProcessLauncher()
        executor.processLauncher = processLauncher

        executor.executeStep(version: "1.0.0", logger: Logger.testLogger)

        expect(processLauncher.receivedProcess?.arguments).to(contain(arguments))
    }

    func testItDoesntCreateTheProcessIfThereIsNoScriptPath() {
        let executor = SwiftScriptExecutor(step: .swiftScript, dictionary: nil)
        let processLauncher = SpyProcessLauncher()
        executor.processLauncher = processLauncher

        executor.executeStep(version: "1.0.0", logger: Logger.testLogger)

        expect(processLauncher.receivedProcess?.launchPath).to(beNil())
    }
}

private class SpyProcessLauncher: ProcessLaunching {
    var receivedProcess: Process?

    func launchProcess(process: Process) {
        receivedProcess = process
    }
}
