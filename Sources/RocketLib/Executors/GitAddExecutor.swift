import Logger

final class GitAddExecutor: DefaultExecutor<GitAddParameters> {
    override func executeStep(version: String, logger: Logger) {
        guard let paths = parameters.paths,
            !paths.isEmpty else {
                logger.logError("Invalid git add paths")
                return
        }
        
        launchScript(content: "git add " + paths.joined(separator: " "), errorMessage: "Git Add step failed with error", logger: logger)
    }
}
