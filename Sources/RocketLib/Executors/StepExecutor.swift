import Foundation
import Logger

public protocol StepExecutor {
    func executeStep(version: String, logger: Logger)
    init(step: Step, dictionary: [String: Any]?)
}
