class ScriptLauncherExecutor<T: StepParameters>: DefaultExecutor<T>, ScriptLauncherContainer {
    let scriptLauncher: ScriptLaunching

    required convenience init(step: Step, dictionary: [String: Any]?) {
        self.init(step: step, dictionary: dictionary, scriptLauncher: ScriptLauncher())
    }

    init(step: Step, dictionary: [String: Any]?, scriptLauncher: ScriptLaunching) {
        self.scriptLauncher = scriptLauncher
        super.init(step: step, dictionary: dictionary)
    }
}
