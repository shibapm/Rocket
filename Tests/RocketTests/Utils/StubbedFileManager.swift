import Foundation

final class StubbedFileManager: FileManager {
    var fileExistsResult = true

    override func fileExists(atPath _: String) -> Bool {
        fileExistsResult
    }
}
