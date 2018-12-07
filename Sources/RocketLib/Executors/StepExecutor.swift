import Foundation
import Logger

public protocol StepExecutor {
    func executeStep(version: String, logger: Logger)

    init(dictionary: [String: Any]?)
}

extension StepExecutor {
    func executeStep(version _: String, logger _: Logger) {}
}
