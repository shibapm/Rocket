import Logger
import Nimble
@testable import RocketLib
import ShellOut
import TestSpy
import XCTest

final class PushExecutorTests: ScriptLauncherTestCase {
    func testItSendsTheCorrectScriptContent() {
        let testRemote = "testRemote"
        let testBranch = "testBranch"
        let dictionary = ["remote": testRemote, "branch": testBranch]

        let executor = PushExecutor(dictionary: dictionary, scriptLauncher: scriptLauncher)
        executor.executeStep(version: "1.0.0", logger: Logger.testLogger)

        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git push \(testRemote) \(testBranch) --tags")))
    }
}
