import Logger
import Foundation

struct TagExecutor: StepExecutor, ScriptLauncherContainer {
    let scriptLauncher: ScriptLaunching
    
    init(scriptLauncher: ScriptLaunching = ScriptLauncher()) {
        self.scriptLauncher = scriptLauncher
    }
    
    func executeStep(version: String, logger: Logger) {
        launchScript(content: "git tag \(version)", errorMessage: "Tag step failed with error", logger: logger)
    }
}
