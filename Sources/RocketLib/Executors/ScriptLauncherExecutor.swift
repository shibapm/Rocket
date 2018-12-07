
class ScriptLauncherExecutor<T: StepParameters>: DefaultExecutor<T>, ScriptLauncherContainer {
    let scriptLauncher: ScriptLaunching

    required convenience init(dictionary: [String: Any]?) {
        self.init(dictionary: dictionary, scriptLauncher: ScriptLauncher.shared)
    }

    init(dictionary: [String: Any]?, scriptLauncher: ScriptLaunching) {
        self.scriptLauncher = scriptLauncher
        super.init(dictionary: dictionary)
    }
}
