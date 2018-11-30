import Yams
import Foundation
import Logger
import RocketLib

let string = try String(contentsOfFile: ".rocket.yml")
let logger = Logger()

guard CommandLine.arguments.count > 1 else {
    logger.logError("You need to provive the version number that you want release")
    exit(1)
}

let version = CommandLine.arguments[1]

guard let loadedDictionary = try Yams.load(yaml: string) as? [String: Any] else {
    logger.logError("Invalid YAML")
    exit(1)
}

let versionExporter = VersionExporter()
versionExporter.exportVersion(version)

let stepExecutors = StepsParser.parseSteps(fromDictionary: loadedDictionary, logger: logger)
stepExecutors.forEach { $0.executeStep(version: version, logger: logger) }
