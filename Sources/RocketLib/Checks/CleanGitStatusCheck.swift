import Foundation

struct CleanGitStatusCheck: Check {
    private static let errorMessage: String = "Your git status contains not committed code, please remove it or commit it"

    let launcher: ScriptLaunching

    init() {
        self.init(launcher: ScriptLauncher())
    }

    init(launcher: ScriptLaunching) {
        self.launcher = launcher
    }

    func check() -> CheckResult {
        let result = try? launcher.launchScript(withContent: "git diff --name-only", version: nil)

        return result?.isEmpty == true ? .success : .failure(CleanGitStatusCheck.errorMessage)
    }
}
