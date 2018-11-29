//
//  TagExecutorTests.swift
//  RocketTests
//
//  Created by Franco on 29/11/2018.
//

import XCTest
@testable import RocketLib
import Logger
import Nimble
import TestSpy

final class TagExecutorTests: XCTestCase {
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
        let testVersion = "1.0.0"
        let executor = TagExecutor(scriptLauncher: scriptLauncher)
        executor.executeStep(version: testVersion, logger: Logger.testLogger)
        
        expect(self.scriptLauncher).to(haveReceived(.launchScript(content: "git tag \(testVersion)")))
    }
}
