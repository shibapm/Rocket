import Nimble
@testable import RocketLib
import TestSpy
import XCTest

final class CleanGitStatusCheckTests: XCTestCase {
    func testReturnsTrueWhenThereIsAreNoModifiedFiles() {
        let scriptLauncher = SpyScriptLauncher()
        scriptLauncher.result = ""
        let check = CleanGitStatusCheck(launcher: scriptLauncher)

        let result = check.check()

        expect(result).to(beTrue())
        expect(scriptLauncher).to(haveReceived(.launchScript(content: "git diff --name-only", version: nil)))
    }

    func testReturnsFalseWhenThereIsAreModifiedFiles() {
        let scriptLauncher = SpyScriptLauncher()
        scriptLauncher.result = "/Franco/Test.swift"
        let check = CleanGitStatusCheck(launcher: scriptLauncher)

        let result = check.check()

        expect(result).to(beFalse())
        expect(scriptLauncher).to(haveReceived(.launchScript(content: "git diff --name-only", version: nil)))
    }
}
