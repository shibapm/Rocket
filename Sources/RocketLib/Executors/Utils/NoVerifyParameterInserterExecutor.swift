import Foundation

class NoVerifyParameterInserterExecutor<T: StepParameters>: ScriptLauncherExecutor<T> {
    let parameterInserter: NoVerifyParameterInserter

    init(step: Step, dictionary: [String: Any]?, scriptLauncher: ScriptLaunching, fileManager: FileManager) {
        parameterInserter = NoVerifyParameterInserter(fileManager: fileManager)
        super.init(step: step, dictionary: dictionary, scriptLauncher: scriptLauncher)
    }

    required convenience init(step: Step, dictionary: [String: Any]?) {
        self.init(step: step, dictionary: dictionary, scriptLauncher: ScriptLauncher(), fileManager: .default)
    }
}
