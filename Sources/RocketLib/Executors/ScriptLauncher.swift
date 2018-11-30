import ShellOut
import Foundation
import Logger

protocol ScriptLaunching {
    var version: String { get set }
    
    func launchScript(withContent content: String) throws
}

final class ScriptLauncher: ScriptLaunching {
    static let shared = ScriptLauncher()
    var version: String = ""
    
    private init() {}
    
    func launchScript(withContent content: String) throws {
        try shellOut(to: ["export VERSION=\(version)", content])
    }
}
