import Logger
import Nimble
@testable import RocketLib
import ShellOut
import TestSpy
import XCTest

final class CommitExecutorTests: ScriptLauncherTestCase {
    func testItUsesTheParametersIfAny() {
        let testMessage = "test"
        let dictionary: [String: Any] = ["message": testMessage, "no_verify": true]

        executeCommitStep(withDictionary: dictionary)

        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git commit -m \"\(testMessage)\" --no-verify")))
    }

    func testItUsesTheStandardCommitMessageIfNoMessageIsProvided() {
        executeCommitStep(withDictionary: nil)

        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git commit -m \"Version 1.0.0\"")))
    }

    private func givenACommitExecutor(dictionary: [String: Any]?) -> CommitExecutor {
        return CommitExecutor(dictionary: dictionary, scriptLauncher: scriptLauncher)
    }

    private func executeCommitStep(withDictionary dictionary: [String: Any]?) {
        givenACommitExecutor(dictionary: dictionary).executeStep(version: "1.0.0", logger: Logger.testLogger)
    }
}
