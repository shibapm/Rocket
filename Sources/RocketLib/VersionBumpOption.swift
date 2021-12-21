public enum VersionBumpOption: String {
    case patch
    case minor
    case major

    private var index: Int {
        switch self {
        case .major:
            return 0
        case .minor:
            return 1
        case .patch:
            return 2
        }
    }

    func newVersion(currentVersion: String) -> String {
        var versionComponent = currentVersion.split(separator: ".").map { String($0) }

        let componentIndex = index
        let newComponent = Int(versionComponent[componentIndex])?.advanced(by: 1) ?? 0
        versionComponent[componentIndex] = newComponent.description

        if self != .patch {
            for i in componentIndex + 1 ... VersionBumpOption.patch.index {
                versionComponent[i] = "0"
            }
        }

        return versionComponent.joined(separator: ".")
    }
}
