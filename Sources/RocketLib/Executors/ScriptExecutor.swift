import Logger
import Foundation

struct ScriptExecutor: StepExecutor {
    let parameters: ScriptParameters
    private let scriptLauncher: ScriptLaunching
    
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
        
        do {
            try scriptLauncher.launchScript(withContent: content)
        } catch {
            logger.logError("Script step with content: \"\(content)\" failed with error", error)
        }
    }
}
