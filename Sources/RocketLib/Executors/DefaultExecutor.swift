import Logger

class DefaultExecutor<T: StepParameters>: StepExecutor {
    let parameters: T

    required init(dictionary: [String: Any]?) {
        parameters = T(dictionary: dictionary)
    }
}
