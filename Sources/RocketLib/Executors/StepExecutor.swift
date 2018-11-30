import Logger
import Foundation

public protocol StepExecutor {
    func executeStep(version: String, logger: Logger)
    
    init(dictionary: [String:Any]?)
}
