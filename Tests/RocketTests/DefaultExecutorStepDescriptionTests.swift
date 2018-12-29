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

    func testItShowsTheCorrectStartDescriptionWhenThereAreNoParameters() {
        let dictionary: [String: Any] = [:]
        let executor = DefaultExecutor<TagParameters>(step: .tag, dictionary: dictionary)

        executor.printStartStepDescription(logger: logger)

        expect(self.printer.receivedMessages) == ["- tag"]
    }

    func testItShowsTheCorrectStartDescriptionWhenThereAreParameters() {
        let dictionary: [String: Any] = ["arguments": ["a", "b", "c"]]
        let executor = DefaultExecutor<SwiftScriptParameters>(step: .swiftScript, dictionary: dictionary)

        executor.printStartStepDescription(logger: logger)

        expect(self.printer.receivedMessages) == ["- swift_script (arguments=[\"a\", \"b\", \"c\"])"]
    }

    func testItShowsTheCorrectEndDescriptionWhenThereAreNoParameters() {
        let dictionary: [String: Any] = [:]
        let executor = DefaultExecutor<TagParameters>(step: .tag, dictionary: dictionary)

        executor.printEndStepDescription(logger: logger)

        expect(self.printer.receivedMessages[0]) == "\r"
        expect(self.printer.receivedMessages[1].contains("tag")) == true
        expect(self.printer.receivedMessages[1].contains("(")) == false
    }

    func testItShowsTheCorrectEndDescriptionWhenThereAreParameters() {
        let dictionary: [String: Any] = ["arguments": ["a", "b", "c"]]
        let executor = DefaultExecutor<SwiftScriptParameters>(step: .swiftScript, dictionary: dictionary)

        executor.printEndStepDescription(logger: logger)

        expect(self.printer.receivedMessages[0]) == "\r"
        expect(self.printer.receivedMessages[1].contains("swift_script (arguments=[\"a\", \"b\", \"c\"])")) == true
    }
}
