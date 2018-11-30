import XCTest
@testable import RocketLib
import Logger
import Nimble
import TestSpy

final class GitAddExecutorTests: ScriptLauncherTestCase {
    func testItSendsTheCorrectPathsToTheScriptLauncher() {
        let testContent = ["a", "b", "c"]
        executeStep(withDictionary: ["paths": testContent])
        
        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git add a b c")))
    }
    
    func testItDoesntSendAnyCommandToTheScriptLauncherIfThePathsAreEmpty() {
        let testContent: [String] = []
        executeStep(withDictionary: ["content": testContent])
        
        expect(self.scriptLauncher).to(beEmpty())
    }
    
    func testItDoesntSendAnyCommandToTheScriptLauncherIfTheDictionaryIsNil() {
        executeStep(withDictionary: nil)
        
        expect(self.scriptLauncher).to(beEmpty())
    }
    
    private func givenAGitAddExecutor(dictionary: [String:Any]?) -> GitAddExecutor {
        return GitAddExecutor(dictionary: dictionary, scriptLauncher: scriptLauncher)
    }
    
    private func executeStep(withDictionary dictionary: [String:Any]?) {
        let scriptExecutor = givenAGitAddExecutor(dictionary: dictionary)
        scriptExecutor.executeStep(version: "1.0.0", logger: Logger.testLogger)
    }
}
