import Foundation

struct CleanGitStatusCheck: PreReleaseCheck {
    let launcher: ScriptLaunching

    func check() -> Bool {
        let result = try? launcher.launchScript(withContent: "git diff --name-only", version: nil)

        return result?.isEmpty ?? true
    }
}
