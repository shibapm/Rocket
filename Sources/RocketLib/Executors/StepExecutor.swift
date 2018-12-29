import Foundation
import Logger

public protocol StepExecutor {
    func printStartStepDescription(logger: Logger)
    func printEndStepDescription(logger: Logger)
    func executeStep(version: String, logger: Logger)
    init(step: Step, dictionary: [String: Any]?)
}
