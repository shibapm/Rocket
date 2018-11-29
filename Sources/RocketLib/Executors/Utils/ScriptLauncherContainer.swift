import Foundation
import Logger

protocol ScriptLauncherContainer {
    var scriptLauncher: ScriptLaunching { get }
}

extension ScriptLauncherContainer {
    func launchScript(content: String, errorMessage: String, logger: Logger) {
        do {
            try scriptLauncher.launchScript(withContent: content)
        } catch {
            logger.logError(errorMessage, error)
            exit(1)
        }
    }
}
