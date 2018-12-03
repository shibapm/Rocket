import Logger

class DefaultExecutor<T: StepParameters>: StepExecutor, ScriptLauncherContainer {
    let parameters: T
    let scriptLauncher: ScriptLaunching

    required convenience init(dictionary: [String: Any]?) {
        self.init(dictionary: dictionary, scriptLauncher: ScriptLauncher.shared)
    }

    init(dictionary: [String: Any]?, scriptLauncher: ScriptLaunching) {
        parameters = T(dictionary: dictionary)
        self.scriptLauncher = scriptLauncher
    }

    func executeStep(version _: String, logger _: Logger) {
        fatalError("Not implemented")
    }
}
