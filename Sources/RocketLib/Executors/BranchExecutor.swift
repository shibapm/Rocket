import Foundation
import Logger

final class BranchExecutor: ScriptLauncherExecutor<BranchParameters> {
    override func executeStep(version: String, logger: Logger) {
        guard let branchName = parameters.name,
            !branchName.isEmpty else {
            logger.logError("Invalid branch name")
            return
        }

        let script = "git branch " + branchName + " && git checkout " + branchName
        launchScript(content: script, version: version, errorMessage: "Branch step failed with error", logger: logger)
    }
}
