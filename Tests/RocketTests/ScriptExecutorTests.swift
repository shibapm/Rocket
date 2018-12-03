import Logger
import Nimble
@testable import RocketLib
import TestSpy
import XCTest

final class ScriptExecutorTests: ScriptLauncherTestCase {
    func testItSendsTheCorrectScriptToTheScriptLauncher() {
        let testContent = "test"
        executeStep(withDictionary: ["content": testContent])

        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: testContent)))
    }

    func testItDoesntSendAnyCommandToTheScriptLauncherIfTheContentIsEmpty() {
        let testContent = ""
        executeStep(withDictionary: ["content": testContent])

        expect(self.scriptLauncher).to(beEmpty())
    }

    func testItDoesntSendAnyCommandToTheScriptLauncherIfTheDictionaryIsNil() {
        executeStep(withDictionary: nil)

        expect(self.scriptLauncher).to(beEmpty())
    }

    private func givenAScriptExecutor(dictionary: [String: Any]?) -> ScriptExecutor {
        return ScriptExecutor(dictionary: dictionary, scriptLauncher: scriptLauncher)
    }

    private func executeStep(withDictionary dictionary: [String: Any]?) {
        let scriptExecutor = givenAScriptExecutor(dictionary: dictionary)
        scriptExecutor.executeStep(version: "1.0.0", logger: Logger.testLogger)
    }
}
