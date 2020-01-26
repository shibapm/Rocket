import Logger
import Nimble
@testable import RocketLib
import TestSpy
import XCTest

final class PushExecutorTests: ScriptLauncherTestCase {
    var fileManager: StubbedFileManager!

    override func setUp() {
        super.setUp()
        fileManager = StubbedFileManager()
    }

    func testItSendsTheCorrectScriptContent() {
        let testRemote = "testRemote"
        let testBranch = "testBranch"
        let dictionary = ["remote": testRemote, "branch": testBranch]

        executeStep(dictionary: dictionary, hasGitHookFolder: false)

        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git push \(testRemote) \(testBranch) --tags", version: "1.0.0")))
    }

    func testItAddsTheNoVerifyParameterIfGitHookFolderIsPresent() {
        executeStep(dictionary: [:], hasGitHookFolder: true)

        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git push origin HEAD --tags --no-verify", version: "1.0.0")))
    }

    func testItSendsTheNoVerifyParameterIfRequired() {
        let dictionary = ["no_verify": true]

        executeStep(dictionary: dictionary, hasGitHookFolder: false)

        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git push origin HEAD --tags --no-verify", version: "1.0.0")))
    }

    private func executeStep(dictionary: [String: Any], hasGitHookFolder: Bool) {
        fileManager.fileExistsResult = hasGitHookFolder
        let executor = PushExecutor(step: .push, dictionary: dictionary, scriptLauncher: scriptLauncher, fileManager: fileManager)
        executor.executeStep(version: "1.0.0", logger: Logger.testLogger)
    }
}
