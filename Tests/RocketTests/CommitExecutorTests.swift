import Logger
import Nimble
@testable import RocketLib
import ShellOut
import TestSpy
import XCTest

final class CommitExecutorTests: ScriptLauncherTestCase {
    var fileManager: StubbedFileManager!

    override func setUp() {
        super.setUp()
        fileManager = StubbedFileManager()
    }

    func testItUsesTheParametersIfAny() {
        let testMessage = "test"
        let dictionary: [String: Any] = ["message": testMessage, "no_verify": true]

        executeCommitStep(withDictionary: dictionary, gitHookFolderExists: false)

        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git commit -m \"\(testMessage)\" --no-verify")))
    }

    func testItSetsTheParameterIfTheGitHookFolderExists() {
        let testMessage = "test"
        let dictionary: [String: Any] = ["message": testMessage]

        executeCommitStep(withDictionary: dictionary, gitHookFolderExists: true)

        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git commit -m \"\(testMessage)\" --no-verify")))
    }

    func testItUsesTheStandardCommitMessageIfNoMessageIsProvided() {
        executeCommitStep(withDictionary: nil, gitHookFolderExists: false)

        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git commit -m \"Version 1.0.0\"")))
    }

    private func givenACommitExecutor(dictionary: [String: Any]?, gitHookFolderExists: Bool) -> CommitExecutor {
        fileManager.fileExistsResult = gitHookFolderExists
        return CommitExecutor(dictionary: dictionary, scriptLauncher: scriptLauncher, fileManager: fileManager)
    }

    private func executeCommitStep(withDictionary dictionary: [String: Any]?, gitHookFolderExists: Bool) {
        givenACommitExecutor(dictionary: dictionary, gitHookFolderExists: gitHookFolderExists).executeStep(version: "1.0.0", logger: Logger.testLogger)
    }
}
