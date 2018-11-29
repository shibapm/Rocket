import XCTest
@testable import RocketLib
import Logger
import Nimble
import TestSpy

final class TagExecutorTests: ExecutorTestCase {
    func testItSendsTheCorrectScriptToTheScriptLauncher() {
        let testVersion = "1.0.0"
        let executor = TagExecutor(scriptLauncher: scriptLauncher)
        executor.executeStep(version: testVersion, logger: Logger.testLogger)
        
        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git tag \(testVersion)")))
    }
}
