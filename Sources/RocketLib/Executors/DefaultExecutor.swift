import Logger

class DefaultExecutor<T: StepParameters>: StepExecutor {
    let parameters: T
    let step: Step
    let stepDescriptionPrinter = StepDescriptionPrinter()

    required init(step: Step, dictionary: [String: Any]?) {
        self.step = step
        parameters = T(dictionary: dictionary)
    }

    func printStartStepDescription(logger: Logger) {
        stepDescriptionPrinter.printStepDescription(forDefaultExecutor: self, logger: logger, type: .start)
    }

    func printEndStepDescription(logger: Logger) {
        stepDescriptionPrinter.printStepDescription(forDefaultExecutor: self, logger: logger, type: .end)
    }

    func executeStep(version _: String, logger _: Logger) {
        fatalError("Not implemented")
    }
}
