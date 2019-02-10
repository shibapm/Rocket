@testable import RocketLib
import XCTest

final class NewVersionProviderTests: XCTestCase {
    func testReturnsTheCorrectNewVersion() throws {
        let versionProvider = FakeCurrentVersionProvider()
        XCTAssertEqual(
            try NewVersionProvider.newVersion(.patch, currentVersionProvider: versionProvider),
            "1.1.2"
        )

        XCTAssertEqual(
            try NewVersionProvider.newVersion(.minor, currentVersionProvider: versionProvider),
            "1.2.0"
        )

        XCTAssertEqual(
            try NewVersionProvider.newVersion(.major, currentVersionProvider: versionProvider),
            "2.0.0"
        )
    }
}

private class FakeCurrentVersionProvider: CurrentVersionProviding {
    func currentVersion() throws -> String {
        return "1.1.1"
    }
}
