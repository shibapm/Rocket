public enum NewVersionProvider {
    public static func newVersion(_ versionBumpOption: VersionBumpOption, currentVersionProvider: CurrentVersionProviding? = nil) throws -> String {
        let currentVersionProvider = currentVersionProvider ?? CurrentVersionProvider()
        let currentVersion = try currentVersionProvider.currentVersion()

        return versionBumpOption.newVersion(currentVersion: currentVersion)
    }
}
