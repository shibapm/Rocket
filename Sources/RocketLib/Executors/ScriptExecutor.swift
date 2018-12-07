import Foundation
import Logger

final class ScriptExecutor: ScriptLauncherExecutor<ScriptParameters> {
    override func executeStep(version _: String, logger: Logger) {
        guard let content = parameters.content,
            !content.isEmpty else {
            logger.logError("Invalid script content")
            return
        }

        launchScript(content: content, errorMessage: "Script step with content: \"\(content)\" failed with error", logger: logger)
    }
}
