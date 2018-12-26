import Foundation

protocol NoVerifyParameterInserting {
    var fileManager: FileManager { get }
    func insertNoVerifyParameterIfNeeded(string: inout String, noVerifyParameter: Bool?)
}

extension NoVerifyParameterInserting {
    func insertNoVerifyParameterIfNeeded(string: inout String, noVerifyParameter: Bool?) {
        if shouldAddNoVerifyParameter(noVerifyParameter: noVerifyParameter) {
            string += " --no-verify"
        }
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
