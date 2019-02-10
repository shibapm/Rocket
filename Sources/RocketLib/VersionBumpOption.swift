public enum VersionBumpOption: String {
    case patch
    case minor
    case major

    func newVersion(currentVersion: String) -> String {
        let componentIndex: Int

        switch self {
        case .major:
            componentIndex = 0
        case .minor:
            componentIndex = 1
        case .patch:
            componentIndex = 2
        }

        var versionComponent = currentVersion.split(separator: ".").map { String($0) }

        let newComponent = Int(versionComponent[componentIndex])?.advanced(by: 1) ?? 0
        versionComponent[componentIndex] = newComponent.description
        return versionComponent.joined(separator: ".")
    }
}
