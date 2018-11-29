import Logger

public protocol StepExecutor {
    func executeStep(version: String, logger: Logger)
}
