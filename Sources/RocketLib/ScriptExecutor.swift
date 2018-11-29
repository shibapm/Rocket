import ShellOut
import Logger

struct ScriptExecutor: StepExecutor {
    private let parameters: ScriptParameters
    private let scriptLauncher: ScriptLaunching
    
    init(dictionary: [String:Any], scriptLauncher: ScriptLaunching = ScriptLauncher()) {
        parameters = ScriptParameters(dictionary: dictionary)
        self.scriptLauncher = scriptLauncher
    }
    
    func executeStep(logger: Logger) {
        guard let content = parameters.content,
            !content.isEmpty else {
            logger.logError("Invalid script content")
            return
        }
        
        do {
            try scriptLauncher.launchScript(withContent: content)
        } catch {
            logger.logError(error)
        }
    }
}

protocol ScriptLaunching {
    func launchScript(withContent content: String) throws
}

struct ScriptLauncher: ScriptLaunching {
    func launchScript(withContent content: String) throws {
        try shellOut(to: content)
    }
}
