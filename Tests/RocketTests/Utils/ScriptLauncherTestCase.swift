import XCTest

class ScriptLauncherTestCase: XCTestCase {
    var scriptLauncher: SpyScriptLauncher!

    override func setUp() {
        super.setUp()
        scriptLauncher = SpyScriptLauncher()
    }

    override func tearDown() {
        super.tearDown()
        scriptLauncher = nil
    }
}
