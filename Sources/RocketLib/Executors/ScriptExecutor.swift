import Logger
import Foundation

struct ScriptExecutor: StepExecutor, ScriptLauncherContainer {
    let parameters: ScriptParameters
    let scriptLauncher: ScriptLaunching
    
    init(dictionary: [String:Any]?, scriptLauncher: ScriptLaunching = ScriptLauncher()) {
        parameters = ScriptParameters(dictionary: dictionary)
        self.scriptLauncher = scriptLauncher
    }
    
    func executeStep(version: String, logger: Logger) {
        guard let content = parameters.content,
            !content.isEmpty else {
                logger.logError("Invalid script content")
                return
        }
        
        launchScript(content: content, errorMessage: "Script step with content: \"\(content)\" failed with error", logger: logger)
    }
}
