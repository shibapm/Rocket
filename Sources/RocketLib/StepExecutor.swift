import Logger

public protocol StepExecutor {
    func executeStep(logger: Logger)
}
