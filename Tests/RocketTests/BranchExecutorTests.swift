import Logger
import Nimble
@testable import RocketLib
import TestSpy
import XCTest

final class BranchExecutorTests: ScriptLauncherTestCase {
    func testItSendsTheCorrectBranchNameToScriptLauncher() {
        let branchName = "test-branch"
        executeStep(withDictionary: ["name": branchName])

        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git branch test-branch && git checkout test-branch", version: "1.0.0")))
    }

    func testItSendsMasterBranchNameIfTheDictionaryIsNil() {
        executeStep(withDictionary: nil)

        expect(self.scriptLauncher).to(beEmpty())
    }

    private func givenABranchExecutor(dictionary: [String: Any]?) -> BranchExecutor {
        return BranchExecutor(step: .branch, dictionary: dictionary, scriptLauncher: scriptLauncher)
    }

    private func executeStep(withDictionary dictionary: [String: Any]?) {
        let scriptExecutor = givenABranchExecutor(dictionary: dictionary)
        scriptExecutor.executeStep(version: "1.0.0", logger: Logger.testLogger)
    }
}
