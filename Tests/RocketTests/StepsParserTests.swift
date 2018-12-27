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

    func testItParsesCorrectlyBeforeAndAfterSteps() {
        let dictionary = [
            "before": [
                ["script": ["content": "swiftlint"]],
            ],
            "after": [
                ["script": ["content": "Script/after.sh"]],
            ],
        ]

        let steps = StepsParser.parseSteps(fromDictionary: dictionary, logger: logger)

        expect((steps[0] as! ScriptExecutor).parameters.content) == "swiftlint"
        expect((steps[1] as! HideDevDependenciesExecutor).parameters.packagePath) == "Package.swift"
        expect((steps[2] as! GitAddExecutor).parameters.paths) == ["."]
        expect(steps[3]).to(beAKindOf(CommitExecutor.self))
        expect(steps[4]).to(beAKindOf(TagExecutor.self))
        expect((steps[5] as! UnhideDevDependenciesExecutor).parameters.packagePath) == "Package.swift"
        expect((steps[6] as! GitAddExecutor).parameters.paths) == ["."]
        expect(steps[7]).to(beAKindOf(CommitExecutor.self))
        expect((steps[8] as! ScriptExecutor).parameters.content) == "Script/after.sh"
    }

    func testItParsesCorrectlyWhenOnlyBeforeIsSpecified() {
        let dictionary = [
            "before": [
                ["script": ["content": "swiftlint"]],
            ],
        ]

        let steps = StepsParser.parseSteps(fromDictionary: dictionary, logger: logger)

        expect((steps[0] as! ScriptExecutor).parameters.content) == "swiftlint"
        expect(steps.count) == 8
    }

    func testItParsesCorrectlyWhenOnlyAfterIsSpecified() {
        let dictionary = [
            "after": [
                ["script": ["content": "Script/after.sh"]],
            ],
        ]

        let steps = StepsParser.parseSteps(fromDictionary: dictionary, logger: logger)

        expect((steps[7] as! ScriptExecutor).parameters.content) == "Script/after.sh"
        expect(steps.count) == 8
    }
}

extension PushParameters: Equatable {
    public static func == (lhs: PushParameters, rhs: PushParameters) -> Bool {
        return lhs.branch == rhs.branch &&
            lhs.remote == rhs.remote
    }
}
