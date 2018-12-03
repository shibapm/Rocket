import Nimble
@testable import RocketLib
import XCTest

final class VersionExporterTests: ScriptLauncherTestCase {
    func testItSetsTheCorrectVersionToTheScriptLauncher() {
        let version = "1.0.0"
        let versionExporter = VersionExporter(scriptLauncher: scriptLauncher)
        versionExporter.exportVersion(version)

        expect(self.scriptLauncher.version) == version
    }
}
