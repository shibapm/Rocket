import XCTest

extension CommitExecutorTests {
    static let __allTests = [
        ("testItUsesAWorkaroundToGenerateTheTestsOnLinux", testItUsesAWorkaroundToGenerateTheTestsOnLinux),
        ("testItUsesTheParametersIfAny", testItUsesTheParametersIfAny),
        ("testItUsesTheStandardCommitMessageIfNoMessageIsProvided", testItUsesTheStandardCommitMessageIfNoMessageIsProvided),
    ]
}

extension DevDependenciesModifierTests {
    static let __allTests = [
        ("testItHidesTheDependenciesCorrectly", testItHidesTheDependenciesCorrectly),
        ("testItShowsTheDependenciesCorrectly", testItShowsTheDependenciesCorrectly),
    ]
}

extension GitAddExecutorTests {
    static let __allTests = [
        ("testItDoesntSendAnyCommandToTheScriptLauncherIfTheDictionaryIsNil", testItDoesntSendAnyCommandToTheScriptLauncherIfTheDictionaryIsNil),
        ("testItSendsTheCorrectPathsToTheScriptLauncher", testItSendsTheCorrectPathsToTheScriptLauncher),
        ("testItUsesAWorkaroundToGenerateTheTestsOnLinux", testItUsesAWorkaroundToGenerateTheTestsOnLinux),
    ]
}

extension HideDevDependenciesExecutorTests {
    static let __allTests = [
        ("testItSendsTheHideDependenciesCallToTheDevDependenciesModifier", testItSendsTheHideDependenciesCallToTheDevDependenciesModifier),
        ("testItUsesTheDefaultPackagePath", testItUsesTheDefaultPackagePath),
    ]
}

extension PushExecutorTests {
    static let __allTests = [
        ("testItSendsTheCorrectScriptContent", testItSendsTheCorrectScriptContent),
        ("testItUsesAWorkaroundToGenerateTheTestsOnLinux", testItUsesAWorkaroundToGenerateTheTestsOnLinux),
    ]
}

extension ScriptExecutorTests {
    static let __allTests = [
        ("testItDoesntSendAnyCommandToTheScriptLauncherIfTheContentIsEmpty", testItDoesntSendAnyCommandToTheScriptLauncherIfTheContentIsEmpty),
        ("testItDoesntSendAnyCommandToTheScriptLauncherIfTheDictionaryIsNil", testItDoesntSendAnyCommandToTheScriptLauncherIfTheDictionaryIsNil),
        ("testItSendsTheCorrectScriptToTheScriptLauncher", testItSendsTheCorrectScriptToTheScriptLauncher),
        ("testItUsesAWorkaroundToGenerateTheTestsOnLinux", testItUsesAWorkaroundToGenerateTheTestsOnLinux),
    ]
}

extension StepsParserTests {
    static let __allTests = [
        ("testItIgnoresTheInvalidSteps", testItIgnoresTheInvalidSteps),
        ("testItParsesCorrectlyAValidDictionary", testItParsesCorrectlyAValidDictionary),
    ]
}

extension TagExecutorTests {
    static let __allTests = [
        ("testItSendsTheCorrectScriptToTheScriptLauncher", testItSendsTheCorrectScriptToTheScriptLauncher),
        ("testItUsesAWorkaroundToGenerateTheTestsOnLinux", testItUsesAWorkaroundToGenerateTheTestsOnLinux),
    ]
}

extension UnhideDevDependenciesExecutorTests {
    static let __allTests = [
        ("testItSendsTheHideDependenciesCallToTheDevDependenciesModifier", testItSendsTheHideDependenciesCallToTheDevDependenciesModifier),
        ("testItUsesTheDefaultPackagePath", testItUsesTheDefaultPackagePath),
    ]
}

extension VersionExporterTests {
    static let __allTests = [
        ("testItSetsTheCorrectVersionToTheScriptLauncher", testItSetsTheCorrectVersionToTheScriptLauncher),
        ("testItUsesAWorkaroundToGenerateTheTestsOnLinux", testItUsesAWorkaroundToGenerateTheTestsOnLinux),
    ]
}

#if !os(macOS)
    public func __allTests() -> [XCTestCaseEntry] {
        return [
            testCase(CommitExecutorTests.__allTests),
            testCase(DevDependenciesModifierTests.__allTests),
            testCase(GitAddExecutorTests.__allTests),
            testCase(HideDevDependenciesExecutorTests.__allTests),
            testCase(PushExecutorTests.__allTests),
            testCase(ScriptExecutorTests.__allTests),
            testCase(StepsParserTests.__allTests),
            testCase(TagExecutorTests.__allTests),
            testCase(UnhideDevDependenciesExecutorTests.__allTests),
            testCase(VersionExporterTests.__allTests),
        ]
    }
#endif
