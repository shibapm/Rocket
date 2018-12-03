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
    
    // workaround to make the swift test --generate-linuxmain work
    func testItUsesAWorkaroundToGenerateTheTestsOnLinux() {
        
    }
}
