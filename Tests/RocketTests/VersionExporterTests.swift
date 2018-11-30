import XCTest
@testable import RocketLib
import Nimble

final class VersionExporterTests: LauncherTestCase {
    func testItSetsTheCorrectVersionToTheScriptLauncher() {
        let version = "1.0.0"
        let versionExporter = VersionExporter(scriptLauncher: self.scriptLauncher)
        versionExporter.exportVersion(version)
        
        expect(self.scriptLauncher.version) == version
    }
}
