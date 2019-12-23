public protocol Check {
    init()

    func check() -> CheckResult
}

public enum CheckResult: Equatable {
    case success
    case failure(String)
}
