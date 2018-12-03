import Logger

public final class VersionExporter {
    var scriptLauncher: ScriptLaunching

    public convenience init() {
        self.init(scriptLauncher: ScriptLauncher.shared)
    }

    init(scriptLauncher: ScriptLaunching) {
        self.scriptLauncher = scriptLauncher
    }

    public func exportVersion(_ version: String) {
        scriptLauncher.version = version
    }
}
