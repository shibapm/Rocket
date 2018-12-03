import Logger
import Nimble
@testable import RocketLib
import TestSpy
import XCTest

final class TagExecutorTests: ScriptLauncherTestCase {
    func testItSendsTheCorrectScriptToTheScriptLauncher() {
        let testVersion = "1.0.0"
        let executor = TagExecutor(dictionary: nil, scriptLauncher: scriptLauncher)
        executor.executeStep(version: testVersion, logger: Logger.testLogger)

        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git tag \(testVersion)")))
    }
}
