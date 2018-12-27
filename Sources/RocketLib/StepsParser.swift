import Foundation
import Logger

public class StepsParser {
    private static let defaultSteps: [Any] = [
        Step.hideDependencies.rawValue,
        Step.gitAdd.rawValue,
        Step.commit.rawValue,
        Step.tag.rawValue,
        Step.unhideDependencies.rawValue,
        Step.gitAdd.rawValue,
        [Step.commit.rawValue: ["message": "Unhide dependencies"]],
    ]

    enum CodingKeys: String {
        case steps
        case before
        case after
    }

    public static func parseSteps(fromDictionary dictionary: [String: Any], logger: Logger) -> [StepExecutor] {
        guard let stepsArray = steps(fromDictionary: dictionary) else {
            logger.logError("Invalid steps")
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

    private static func steps(fromDictionary dictionary: [String: Any]) -> [Any]? {
        if let stepsArray: [Any] = dictionary[CodingKeys.steps] {
            return stepsArray
        } else if dictionary[CodingKeys.before.rawValue] != nil || dictionary[CodingKeys.after.rawValue] != nil {
            let beforeSteps: [Any] = dictionary[CodingKeys.before] ?? []
            let afterSteps: [Any] = dictionary[CodingKeys.after] ?? []

            return beforeSteps + defaultSteps + afterSteps
        } else {
            return nil
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
