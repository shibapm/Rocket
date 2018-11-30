import Foundation
import Logger
import ShellOut

protocol ScriptLauncherContainer {
    var scriptLauncher: ScriptLaunching { get }
}

extension ScriptLauncherContainer {
    func launchScript(content: String, errorMessage: String, logger: Logger) {
        do {
            try scriptLauncher.launchScript(withContent: content)
        } catch {
            let shellError = error as! ShellOutError
            logger.logError(errorMessage, shellError.message)
            exit(1)
        }
    }
    
    func launchScript(command: ShellOutCommand, errorMessage: String, logger: Logger) {
        launchScript(content: command.string, errorMessage: errorMessage, logger: logger)
    }
}
