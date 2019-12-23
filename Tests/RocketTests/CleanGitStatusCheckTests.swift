import Nimble
@testable import RocketLib
import TestSpy
import XCTest

final class CleanGitStatusCheckTests: XCTestCase {
    func testReturnsSuccessWhenThereIsAreNoModifiedFiles() {
        let scriptLauncher = SpyScriptLauncher()
        scriptLauncher.result = ""
        let check = CleanGitStatusCheck(launcher: scriptLauncher)

        let result = check.check()

        expect(result) == .success
        expect(scriptLauncher).to(haveReceived(.launchScript(content: "git diff --name-only", version: nil)))
    }

    func testReturnsFailureWhenThereIsAreModifiedFiles() {
        let scriptLauncher = SpyScriptLauncher()
        scriptLauncher.result = "/Franco/Test.swift"
        let check = CleanGitStatusCheck(launcher: scriptLauncher)

        let result = check.check()

        expect(result) == .failure("Your git status contains not committed code, please remove it or commit it")
        expect(scriptLauncher).to(haveReceived(.launchScript(content: "git diff --name-only", version: nil)))
    }
}
