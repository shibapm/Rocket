import Foundation

struct CleanGitStatusCheck: Check {
    let launcher: ScriptLaunching
    
    var errorMessage: String {
        return "Your git status contains not committed code, please remove it or commit it"
    }

    init() {
        self.init(launcher: ScriptLauncher())
    }

    init(launcher: ScriptLaunching) {
        self.launcher = launcher
    }

    func check() -> Bool {
        let result = try? launcher.launchScript(withContent: "git diff --name-only", version: nil)

        return result?.isEmpty ?? true
    }
}
