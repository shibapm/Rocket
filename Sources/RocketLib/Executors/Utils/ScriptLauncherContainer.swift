import Foundation
import Logger
import SwiftShell

protocol ScriptLauncherContainer {
    var scriptLauncher: ScriptLaunching { get }
}

extension ScriptLauncherContainer {
    func launchScript(content: String, version: String? = nil, errorMessage: String, logger: Logger) {
        do {
            try scriptLauncher.launchScript(withContent: content, version: version, logger: logger)
        } catch {
            logger.logInfo("")

            if let error = error as? ScriptLauncherError {
                logger.logError(errorMessage, error.errorString)
            } else {
                logger.logError(errorMessage, error.localizedDescription)
            }

            exit(1)
        }
    }
}
