import Logger
import Nimble
@testable import RocketLib
import XCTest

final class StepsParserTests: XCTestCase {
    var logger: Logger!

    override func setUp() {
        super.setUp()
        logger = Logger.testLogger
    }

    override func tearDown() {
        logger = nil
        super.tearDown()
    }

    func testItParsesCorrectlyAValidDictionary() {
        let dictionary = ["steps":
            [
                ["script": ["content": "swiftlint"]],
                "tag",
                ["git_add": ["paths": ["a", "b"]]],
                "commit",
                ["commit": ["message": "message"]],
                ["push": ["remote": "testRemote", "branch": "testBranch"]],
                ["hide_dev_dependencies": ["package_path": "testPackage.swift"]],
                "unhide_dev_dependencies",
        ]]

        let steps = StepsParser.parseSteps(fromDictionary: dictionary, logger: logger)

        expect((steps[0] as! ScriptExecutor).parameters.content) == "swiftlint"
        expect(steps[1]).to(beAKindOf(TagExecutor.self))
        expect((steps[2] as! GitAddExecutor).parameters.paths) == ["a", "b"]
        expect((steps[3] as! CommitExecutor).parameters.message).to(beNil())
        expect((steps[4] as! CommitExecutor).parameters.message) == "message"
        expect((steps[5] as! PushExecutor).parameters) == PushParameters(dictionary: ["remote": "testRemote", "branch": "testBranch"])
        expect((steps[6] as! HideDevDependenciesExecutor).parameters.packagePath) == "testPackage.swift"
        expect((steps[7] as! UnhideDevDependenciesExecutor).parameters.packagePath) == "Package.swift"
    }

    func testItIgnoresTheInvalidSteps() {
        let dictionary = ["steps":
            [
                ["script": ["content": "swiftlint"]],
                "tag",
                "invalid",
                ["commit": ["message": "message"]],
                "push",
        ]]

        let steps = StepsParser.parseSteps(fromDictionary: dictionary, logger: logger)

        expect(steps[0]).to(beAKindOf(ScriptExecutor.self))
        expect(steps[1]).to(beAKindOf(TagExecutor.self))
        expect(steps[2]).to(beAKindOf(CommitExecutor.self))
        expect(steps[3]).to(beAKindOf(PushExecutor.self))
    }
}

extension PushParameters: Equatable {
    public static func == (lhs: PushParameters, rhs: PushParameters) -> Bool {
        return lhs.branch == rhs.branch &&
            lhs.remote == rhs.remote
    }
}
