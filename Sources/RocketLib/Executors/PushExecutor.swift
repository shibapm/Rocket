import Logger

final class PushExecutor: ScriptLauncherExecutor<PushParameters> {
    func executeStep(version _: String, logger: Logger) {
        var scriptString = "git push \(parameters.remote) \(parameters.branch) --tags"

        if parameters.noVerify {
            scriptString += " --no-verify"
        }

        launchScript(content: scriptString, errorMessage: "Push step failed with error", logger: logger)
    }
}
