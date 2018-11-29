import XCTest

class ExecutorTestCase: XCTestCase {
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
