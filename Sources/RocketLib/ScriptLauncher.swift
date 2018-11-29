import ShellOut

protocol ScriptLaunching {
    func launchScript(withContent content: String) throws
}

struct ScriptLauncher: ScriptLaunching {
    func launchScript(withContent content: String) throws {
        try shellOut(to: content)
    }
}
