import Foundation

class NoVerifyParameterInserterExecutor<T: StepParameters>: ScriptLauncherExecutor<T> {
    let parameterInserter: NoVerifyParameterInserter

    init(dictionary: [String: Any]?, scriptLauncher: ScriptLaunching, fileManager: FileManager) {
        parameterInserter = NoVerifyParameterInserter(fileManager: fileManager)
        super.init(dictionary: dictionary, scriptLauncher: scriptLauncher)
    }

    required convenience init(dictionary: [String: Any]?) {
        self.init(dictionary: dictionary, scriptLauncher: ScriptLauncher.shared, fileManager: .default)
    }
}
