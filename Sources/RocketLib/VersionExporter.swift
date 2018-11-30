import Logger

public final class VersionExporter {
    var scriptLauncher: ScriptLauncher
    
    public convenience init() {
        self.init(scriptLauncher: ScriptLauncher.shared)
    }
    
    init(scriptLauncher: ScriptLauncher) {
        self.scriptLauncher = scriptLauncher
    }
    
    public func exportVersion(_ version: String) {
        scriptLauncher.version = version
    }
}
