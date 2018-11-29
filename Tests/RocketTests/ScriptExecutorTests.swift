
import XCTest
@testable import RocketLib
import Logger
import Nimble
import TestSpy

final class ScriptExecutorTests: XCTestCase {
    var scriptLauncher: SpyScriptLauncher!
    
    override func setUp() {
        super.setUp()
        scriptLauncher = SpyScriptLauncher()
    }
    
    override func tearDown() {
        super.tearDown()
        scriptLauncher = nil
    }
    
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
    
    private func givenAScriptExecutor(dictionary: [String:Any]?) -> ScriptExecutor {
        return ScriptExecutor(dictionary: dictionary, scriptLauncher: scriptLauncher)
    }

    private func executeStep(withDictionary dictionary: [String:Any]?) {
        let scriptExecutor = givenAScriptExecutor(dictionary: dictionary)
        scriptExecutor.executeStep(logger: Logger.testLogger)
    }
}
