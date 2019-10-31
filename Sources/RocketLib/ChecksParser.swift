import Logger

public enum ChecksParser {
    private enum CodingKeys: String {
        case preReleaseChecks = "pre_release_checks"
    }

    public static func parsePreReleaseChecks(fromDictionary dictionary: [String: Any]) -> [Check] {
        let checksArray: [Any] = dictionary[CodingKeys.preReleaseChecks] ?? []
        return checksArray.compactMap(parseElement)
    }

    private static func parseElement(_ element: Any) -> Check? {
        if let string = element as? String,
            let check = PreReleseCheck(rawValue: string) {
            return check.check(dictionary: nil)
        } else {
            return nil
        }
    }
}
