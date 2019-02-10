@testable import RocketLib
import XCTest

final class CurrentVersionProviderTests: XCTestCase {
    var scriptLaucher: SpyScriptLauncher!
    var currentVersionProvider: CurrentVersionProvider!

    override func setUp() {
        super.setUp()
        scriptLaucher = SpyScriptLauncher()
        currentVersionProvider = CurrentVersionProvider(scriptLauncher: scriptLaucher)
    }

    func testItReturnsTheCorrectTag() {
        let tags = """
        tag1
        tag2
        1.0.0
        0.10.0
        0.9.0
        """

        scriptLaucher.result = tags

        XCTAssertEqual(try currentVersionProvider.currentVersion(), "1.0.0")
    }

    func testItReturnsTheCorrectVersionIfThereAreNoTags() {
        let tags = """
        tag1
        tag2
        """

        scriptLaucher.result = tags

        XCTAssertEqual(try currentVersionProvider.currentVersion(), "0.0.0")
    }
}
