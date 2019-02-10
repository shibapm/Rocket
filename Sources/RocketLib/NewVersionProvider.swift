public enum NewVersionProvider {
    static func newVersion(_ versionBumpOption: VersionBumpOption, currentVersionProvider: CurrentVersionProviding = CurrentVersionProvider()) throws -> String {
        let currentVersion = try currentVersionProvider.currentVersion()

        return versionBumpOption.newVersion(currentVersion: currentVersion)
    }
}
