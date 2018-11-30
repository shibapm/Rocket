import Logger

struct PushExecutor: StepExecutor, ScriptLauncherContainer {
    let parameters: PushParameters
    let scriptLauncher: ScriptLaunching
    
    init(dictionary: [String:Any]?, scriptLauncher: ScriptLaunching = ScriptLauncher.shared) {
        parameters = PushParameters(dictionary: dictionary)
        self.scriptLauncher = scriptLauncher
    }
    
    func executeStep(version: String, logger: Logger) {
        launchScript(command: .gitPush(remote: parameters.remote, branch: parameters.branch), errorMessage: "Push step failed with error", logger: logger)
    }
}
