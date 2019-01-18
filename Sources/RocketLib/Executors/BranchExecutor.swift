import Foundation
import Logger

final class BranchExecutor: ScriptLauncherExecutor<BranchParameters> {
    override func executeStep(version: String, logger: Logger) {
        launchScript(content: "git checkout -b " + parameters.name, version: version, errorMessage: "Branch step failed with error", logger: logger)
    }
}

