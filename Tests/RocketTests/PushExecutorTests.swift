import XCTest
@testable import RocketLib
import Logger
import Nimble
import TestSpy
import ShellOut

final class PushExecutorTests: ScriptLauncherTestCase {
    func testItSendsTheCorrectScriptContent() {
        let testRemote = "testRemote"
        let testBranch = "testBranch"
        let dictionary = ["remote": testRemote, "branch": testBranch]
        
        let executor = PushExecutor(dictionary: dictionary, scriptLauncher: self.scriptLauncher)
        executor.executeStep(version: "1.0.0", logger: Logger.testLogger)
        
        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: ShellOutCommand.gitPush(remote: testRemote, branch: testBranch).string)))
    }

}
