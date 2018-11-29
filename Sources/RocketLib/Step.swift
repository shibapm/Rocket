
public enum Step: String {
    case script
    case commit
    case tag
    case push
    
    func executor(dictionary: [String:Any]?) -> StepExecutor {
        switch self {
        case .script:
            return ScriptExecutor(dictionary: dictionary)
        case .commit:
            return CommitExecutor()
        case .tag:
            return TagExecutor()
        case .push:
            return PushExecutor()
        }
    }
}
