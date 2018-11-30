import Logger

final class PushExecutor: DefaultExecutor<PushParameters> {
    override func executeStep(version: String, logger: Logger) {
        launchScript(command: .gitPush(remote: parameters.remote, branch: parameters.branch), errorMessage: "Push step failed with error", logger: logger)
    }
}
