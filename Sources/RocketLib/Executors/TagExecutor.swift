import Foundation
import Logger

final class TagExecutor: ScriptLauncherExecutor<TagParameters> {
    func executeStep(version: String, logger: Logger) {
        launchScript(content: "git tag \(version)", errorMessage: "Tag step failed with error", logger: logger)
    }
}
