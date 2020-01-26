import Foundation

protocol NoVerifyParameterInserting {
    var fileManager: FileManager { get }
    func insertNoVerifyParameterIfNeeded(string: String, noVerifyParameter: Bool?) -> String
}

extension NoVerifyParameterInserting {
    func insertNoVerifyParameterIfNeeded(string: String, noVerifyParameter: Bool?) -> String {
        return shouldAddNoVerifyParameter(noVerifyParameter: noVerifyParameter) ? string + " --no-verify" : string
    }

    private func shouldAddNoVerifyParameter(noVerifyParameter: Bool?) -> Bool {
        if let noVerify = noVerifyParameter {
            return noVerify
        } else {
            return fileManager.fileExists(atPath: ".git/hooks")
        }
    }
}

struct NoVerifyParameterInserter: NoVerifyParameterInserting {
    let fileManager: FileManager

    init(fileManager: FileManager) {
        self.fileManager = fileManager
    }
}
