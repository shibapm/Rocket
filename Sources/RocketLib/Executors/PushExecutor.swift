import Foundation
import Logger

final class PushExecutor: NoVerifyParameterInserterExecutor<PushParameters> {
    override func executeStep(version _: String, logger: Logger) {
        var scriptString = "git push \(parameters.remote) \(parameters.branch) --tags"

        parameterInserter.insertNoVerifyParameterIfNeeded(string: &scriptString, noVerifyParameter: parameters.noVerify)

        launchScript(content: scriptString, errorMessage: "Push step failed with error", logger: logger)
    }
}
