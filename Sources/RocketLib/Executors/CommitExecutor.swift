import Foundation
import Logger

final class CommitExecutor: NoVerifyParameterInserterExecutor<CommitParameters> {
    override func executeStep(version: String, logger: Logger) {
        let message = parameters.message ?? "Version \(version)"
        var scriptString = "git commit -m \"\(message)\""

        parameterInserter.insertNoVerifyParameterIfNeeded(string: &scriptString, noVerifyParameter: parameters.noVerify)

        launchScript(content: scriptString, version: version, errorMessage: "Commit step failed with error", logger: logger)
    }
}
