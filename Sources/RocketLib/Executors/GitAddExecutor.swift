import Logger

final class GitAddExecutor: ScriptLauncherExecutor<GitAddParameters> {
    override func executeStep(version: String, logger: Logger) {
        launchScript(content: "git add " + parameters.paths.joined(separator: " "), version: version, errorMessage: "Git Add step failed with error", logger: logger)
    }
}
