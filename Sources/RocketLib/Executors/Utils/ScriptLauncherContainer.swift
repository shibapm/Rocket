import Foundation
import Logger
import ShellOut

protocol ScriptLauncherContainer {
    var scriptLauncher: ScriptLaunching { get }
}

extension ScriptLauncherContainer {
    func launchScript(content: String, version: String? = nil, errorMessage: String, logger: Logger) {
        do {
            try scriptLauncher.launchScript(withContent: content, version: version, logger: logger)
        } catch {
            let shellError = error as! ShellOutError
            logger.logError(errorMessage, shellError.message)
            exit(1)
        }
    }

    func launchScript(command: ShellOutCommand, version: String? = nil, errorMessage: String, logger: Logger) {
        launchScript(content: command.string, version: version, errorMessage: errorMessage, logger: logger)
    }
}
