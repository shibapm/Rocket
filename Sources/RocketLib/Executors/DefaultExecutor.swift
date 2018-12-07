import Logger

class DefaultExecutor<T: StepParameters>: StepExecutor {
    let parameters: T

    required init(dictionary: [String: Any]?) {
        parameters = T(dictionary: dictionary)
    }

    func executeStep(version _: String, logger _: Logger) {
        fatalError("Not implemented")
    }
}
