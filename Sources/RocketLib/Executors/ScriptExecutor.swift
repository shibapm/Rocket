import Logger
import Foundation

final class ScriptExecutor: DefaultExecutor<ScriptParameters> {
    override func executeStep(version: String, logger: Logger) {
        guard let content = parameters.content,
            !content.isEmpty else {
                logger.logError("Invalid script content")
                return
        }
        
        launchScript(content: content, errorMessage: "Script step with content: \"\(content)\" failed with error", logger: logger)
    }
}
