import Logger

struct CommitExecutor: StepExecutor, ScriptLauncherContainer {
    let parameters: CommitParameters
    let scriptLauncher: ScriptLaunching
    
    init(dictionary: [String:Any]?, scriptLauncher: ScriptLaunching = ScriptLauncher.shared) {
        parameters = CommitParameters(dictionary: dictionary)
        self.scriptLauncher = scriptLauncher
    }
    
    func executeStep(version: String, logger: Logger) {
        let message = parameters.message ?? "Version \(version)"
        
        launchScript(command: .gitCommit(message: message), errorMessage: "Commit step failed with error", logger: logger)
    }
}
