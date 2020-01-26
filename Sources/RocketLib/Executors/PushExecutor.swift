import Foundation
import Logger

final class PushExecutor: NoVerifyParameterInserterExecutor<PushParameters> {
    override func executeStep(version: String, logger: Logger) {
        let scriptString = parameterInserter.insertNoVerifyParameterIfNeeded(string: "git push \(parameters.remote) \(parameters.branch) --tags",
                                                                             noVerifyParameter: parameters.noVerify)

        launchScript(content: scriptString, version: version, errorMessage: "Push step failed with error", logger: logger)
    }
}
