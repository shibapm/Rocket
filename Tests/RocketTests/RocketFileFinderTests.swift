import Nimble
@testable import RocketLib
import XCTest

final class RocketFileFinderTests: XCTestCase {
    func testItReturnsTheArgumentPathIfPresent() {
        let testPath = "testPath"
        expect(RocketFileFinder.rocketFilePath(args: ["arg1", RocketFileFinder.rocketFileParameter, testPath])) == testPath
    }

    func testItReturnsTheDefaultPathIfNoArgsAreThereAndTheFileExists() {
        expect(RocketFileFinder.rocketFilePath(args: [], fileManager: StubbedFileManager())) == RocketFileFinder.defaultRocketFilePath
    }

    func testItReturnsNilIfThereAreNoArgumentsAndTheDefaultFileDoesntExist() {
        let fileManager = StubbedFileManager()
        fileManager.fileExistsResult = false

        expect(RocketFileFinder.rocketFilePath(args: [], fileManager: fileManager)).to(beNil())
    }
}
