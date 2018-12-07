import Logger

final class GitAddExecutor: ScriptLauncherExecutor<GitAddParameters> {
    override func executeStep(version _: String, logger: Logger) {
        launchScript(content: "git add " + parameters.paths.joined(separator: " "), errorMessage: "Git Add step failed with error", logger: logger)
    }
}
