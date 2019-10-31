import Nimble
@testable import RocketLib
import XCTest

final class ChecksParserTests: XCTestCase {
    func testItParsesCorrectlyAValidDictionary() {
        let dictionary = ["pre_release_checks": ["clean_git"]]

        let checks = ChecksParser.parsePreReleaseChecks(fromDictionary: dictionary)

        expect(checks.count) == 1
        expect(checks[0]).to(beAKindOf(CleanGitStatusCheck.self))
    }

    func testItIgnoresTheInvalidSteps() {
        let dictionary = ["pre_release_checks": [
            "clean_git",
            "invalid",
        ]]

        let checks = ChecksParser.parsePreReleaseChecks(fromDictionary: dictionary)

        expect(checks.count) == 1
        expect(checks[0]).to(beAKindOf(CleanGitStatusCheck.self))
    }
}
