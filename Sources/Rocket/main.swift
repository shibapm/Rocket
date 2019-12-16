import Foundation
import Logger
import PackageConfig
import RocketLib
import Yams

let logger = Logger()

guard CommandLine.arguments.count > 1 else {
    logger.logError("You need to provide the version number that you want release")
    exit(1)
}

let version: String

if let bump = VersionBumpOption(rawValue: CommandLine.arguments[1]) {
    version = try NewVersionProvider.newVersion(bump)
} else {
    version = CommandLine.arguments[1]
}

var dictionary: [String: Any]!

let startingTime = Date()

if let rocketYamlPath = RocketFileFinder.rocketFilePath() {
    let string = try String(contentsOfFile: rocketYamlPath)
    guard let loadedDictionary = try Yams.load(yaml: string) as? [String: Any] else {
        logger.logError("Invalid YAML")
        exit(1)
    }

    dictionary = loadedDictionary
} else if let packageConfig = try? PackageConfiguration.load().configuration,
    let rocketConfig = packageConfig["rocket"] as? [String: Any] {
    dictionary = rocketConfig
} else {
    dictionary = [:]
}

let checks = ChecksParser.parsePreReleaseChecks(fromDictionary: dictionary)
let failedChecks = checks.filter { !$0.check() }

guard failedChecks.isEmpty else {
    logger.logError("Pre release checks failed",
                    failedChecks.map { $0.errorMessage }.joined(separator: "\n"),
                    separator: "\n")
    exit(1)
}

let stepPrinter = StepDescriptionPrinter()
let stepExecutors = StepsParser.parseSteps(fromDictionary: dictionary, logger: logger)
stepExecutors.forEach {
    $0.printStartStepDescription(logger: logger)
    $0.executeStep(version: version, logger: logger)
    $0.printEndStepDescription(logger: logger)
}

logger.logInfo("")
logger.logInfo("Done in", String(format: "%0.4fs", startingTime.timeIntervalSinceNow * -1))
