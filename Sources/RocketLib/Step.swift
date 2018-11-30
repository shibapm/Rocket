
public enum Step: String {
    case script
    case commit
    case tag
    case push
    case gitAdd = "git_add"
    
    func executor(dictionary: [String:Any]?) -> StepExecutor {
        return executorType.init(dictionary: dictionary)
    }
    
    private var executorType: StepExecutor.Type {
        switch self {
        case .script:
            return ScriptExecutor.self
        case .commit:
            return CommitExecutor.self
        case .tag:
            return TagExecutor.self
        case .push:
            return PushExecutor.self
        case .gitAdd:
            return GitAddExecutor.self
        }
    }
}
