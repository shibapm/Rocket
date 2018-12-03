import Logger

final class PushExecutor: DefaultExecutor<PushParameters> {
    override func executeStep(version _: String, logger: Logger) {
        launchScript(content: "git push \(parameters.remote) \(parameters.branch) --tags", errorMessage: "Push step failed with error", logger: logger)
    }
}
