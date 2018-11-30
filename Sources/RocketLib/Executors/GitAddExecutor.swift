import Logger

final class GitAddExecutor: DefaultExecutor<GitAddParameters> {
    override func executeStep(version: String, logger: Logger) {
        let paths = parameters.paths ?? ["."]
        
        launchScript(content: "git add " + paths.joined(separator: " "), errorMessage: "Git Add step failed with error", logger: logger)
    }
}
