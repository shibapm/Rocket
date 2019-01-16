import Logger
import Nimble
@testable import RocketLib
import TestSpy
import XCTest

final class GitAddExecutorTests: ScriptLauncherTestCase {
    func testItSendsTheCorrectPathsToTheScriptLauncher() {
        let testContent = ["a", "b", "c"]
        executeStep(withDictionary: ["paths": testContent])

        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git add a b c", version: "1.0.0")))
    }

    func testItDoesntSendAnyCommandToTheScriptLauncherIfTheDictionaryIsNil() {
        executeStep(withDictionary: nil)

        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git add .", version: "1.0.0")))
    }

    private func givenAGitAddExecutor(dictionary: [String: Any]?) -> GitAddExecutor {
        return GitAddExecutor(step: .gitAdd, dictionary: dictionary, scriptLauncher: scriptLauncher)
    }

    private func executeStep(withDictionary dictionary: [String: Any]?) {
        let scriptExecutor = givenAGitAddExecutor(dictionary: dictionary)
        scriptExecutor.executeStep(version: "1.0.0", logger: Logger.testLogger)
    }
}
