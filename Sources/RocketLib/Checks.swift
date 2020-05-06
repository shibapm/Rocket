enum PreReleseCheck: String {
    case cleanGit = "clean_git"

    func check(dictionary _: [String: Any]?) -> Check {
        checkType.init()
    }

    private var checkType: Check.Type {
        switch self {
        case .cleanGit:
            return CleanGitStatusCheck.self
        }
    }
}
