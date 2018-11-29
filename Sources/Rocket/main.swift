import Yams
import Foundation
import Logger
import RocketLib

let string = try String(contentsOfFile: ".rocket.yml")
let logger = Logger()

guard let loadedDictionary = try Yams.load(yaml: string) as? [String: Any] else {
    logger.logError("Invalid YAML")
    exit(1)
}

let stepExecutors = StepsParser.parseSteps(fromDictionary: loadedDictionary, logger: logger)

stepExecutors.forEach { $0.executeStep() }
