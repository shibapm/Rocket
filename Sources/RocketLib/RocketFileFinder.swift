import Foundation

public final class RocketFileFinder {
    static let rocketFileParameter = "--rocket-file"
    static let defaultRocketFilePath = ".rocket.yml"

    public static func rocketFilePath(args: [String] = CommandLine.arguments, fileManager: FileManager = .default) -> String? {
        if let index = args.firstIndex(of: rocketFileParameter),
            index < args.count - 1 {
            return args[index + 1]
        } else if fileManager.fileExists(atPath: defaultRocketFilePath) {
            return defaultRocketFilePath
        } else {
            return nil
        }
    }
}
