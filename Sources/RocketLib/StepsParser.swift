import Foundation
import Logger

public class StepsParser {
    private static let stepsKey = "steps"

    public static func parseSteps(fromDictionary dictionary: [String: Any], logger: Logger) -> [StepExecutor] {
        guard let stepsArray = dictionary[stepsKey] as? [Any] else {
            logger.logError("Invalid YAML")
            exit(1)
        }

        return stepsArray.compactMap { element in
            if let stepString = element as? String,
                let step = Step(rawValue: stepString) {
                return step.executor(dictionary: nil)
            } else if let stepDict = element as? [String: Any],
                let step = step(fromDictionary: stepDict) {
                return step.executor(dictionary: stepDict[step.rawValue] as? [String: Any])
            } else {
                logger.logWarning("Invalid step found")
                return nil
            }
        }
    }

    private static func step(fromDictionary dictionary: [String: Any]) -> Step? {
        guard let stepString = dictionary.keys.first,
            dictionary.keys.count == 1 else {
            return nil
        }

        return Step(rawValue: stepString)
    }
}
