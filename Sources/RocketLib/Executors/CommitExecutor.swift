import Logger

final class CommitExecutor: ScriptLauncherExecutor<CommitParameters> {
    override func executeStep(version: String, logger: Logger) {
        let message = parameters.message ?? "Version \(version)"
        var scriptString = "git commit -m \"\(message)\""

        if parameters.noVerify {
            scriptString += " --no-verify"
        }

        launchScript(content: scriptString, errorMessage: "Commit step failed with error", logger: logger)
    }
}
