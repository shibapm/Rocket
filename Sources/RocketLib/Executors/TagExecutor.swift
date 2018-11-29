import Logger
import Foundation

struct TagExecutor: StepExecutor {
    private let scriptLauncher: ScriptLaunching
    
    init(scriptLauncher: ScriptLaunching = ScriptLauncher()) {
        self.scriptLauncher = scriptLauncher
    }
    
    func executeStep(version: String, logger: Logger) {
        do {
            try scriptLauncher.launchScript(withContent: "git tag \(version)")
        } catch {
            logger.logError("Tag step failed with error", error)
            exit(1)
        }
    }
}
