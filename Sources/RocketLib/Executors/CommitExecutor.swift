import Logger

final class CommitExecutor: DefaultExecutor<CommitParameters> {
    override func executeStep(version: String, logger: Logger) {
        let message = parameters.message ?? "Version \(version)"
        
        launchScript(command: .gitCommit(message: message), errorMessage: "Commit step failed with error", logger: logger)
    }
}
