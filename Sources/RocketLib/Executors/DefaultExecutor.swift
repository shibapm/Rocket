import Logger

class DefaultExecutor<T: StepParameters>: StepExecutor {
    let parameters: T
    let step: Step

    required init(step: Step, dictionary: [String: Any]?) {
        self.step = step
        parameters = T(dictionary: dictionary)
    }

    func executeStep(version _: String, logger _: Logger) {
        fatalError("Not implemented")
    }
}
