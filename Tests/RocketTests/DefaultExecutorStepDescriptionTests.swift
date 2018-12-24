import Logger
import Nimble
@testable import RocketLib
import XCTest

final class DefaultExecutorStepDescriptionTests: XCTestCase {
    var printer: SpyPrinter!
    var logger: Logger!

    override func setUp() {
        super.setUp()
        printer = SpyPrinter()
        logger = Logger(isVerbose: false, isSilent: false, printer: printer)
    }

    func testItShowsTheCorrectDescriptionWhenThereAreNoParameters() {
        let dictionary: [String: Any] = [:]
        let executor = DefaultExecutor<TagParameters>(step: .tag, dictionary: dictionary)

        executor.printStepDescription(logger: logger)

        expect(self.printer.receivedMessages) == [
            "",
            "==============================================",
            "",
            "- Executing step:",
            "",
            "tag",
            "",
            "==============================================",
            "",
        ]
    }

    func testItShowsTheCorrectDescriptionWhenThereAreParameters() {
        let dictionary: [String: Any] = ["arguments": ["a", "b", "c"]]
        let executor = DefaultExecutor<SwiftScriptParameters>(step: .swiftScript, dictionary: dictionary)

        executor.printStepDescription(logger: logger)

        expect(self.printer.receivedMessages) == [
            "",
            "==============================================",
            "",
            "- Executing step:",
            "",
            "swift_script",
            "",
            "",
            "- Parameters:",
            "",
            "arguments: [\"a\", \"b\", \"c\"]",
            "",
            "==============================================",
            "",
        ]
    }

    func testItShowsTheCorrectDescriptionWhenParametersAreNil() {
        let dictionary: [String: Any] = [:]
        let executor = DefaultExecutor<ScriptParameters>(step: .script, dictionary: dictionary)

        executor.printStepDescription(logger: logger)

        expect(self.printer.receivedMessages) == [
            "",
            "==============================================",
            "",
            "- Executing step:",
            "",
            "script",
            "",
            "==============================================",
            "",
        ]
    }
}
