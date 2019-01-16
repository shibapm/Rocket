import XCTest

extension CommitExecutorTests {
    static let __allTests = [
        ("testItSetsTheParameterIfTheGitHookFolderExists", testItSetsTheParameterIfTheGitHookFolderExists),
        ("testItUsesAWorkaroundToGenerateTheTestsOnLinux", testItUsesAWorkaroundToGenerateTheTestsOnLinux),
        ("testItUsesTheParametersIfAny", testItUsesTheParametersIfAny),
        ("testItUsesTheStandardCommitMessageIfNoMessageIsProvided", testItUsesTheStandardCommitMessageIfNoMessageIsProvided),
    ]
}

extension DefaultExecutorStepDescriptionTests {
    static let __allTests = [
        ("testItShowsTheCorrectEndDescriptionWhenThereAreNoParameters", testItShowsTheCorrectEndDescriptionWhenThereAreNoParameters),
        ("testItShowsTheCorrectEndDescriptionWhenThereAreParameters", testItShowsTheCorrectEndDescriptionWhenThereAreParameters),
        ("testItShowsTheCorrectStartDescriptionWhenThereAreNoParameters", testItShowsTheCorrectStartDescriptionWhenThereAreNoParameters),
        ("testItShowsTheCorrectStartDescriptionWhenThereAreParameters", testItShowsTheCorrectStartDescriptionWhenThereAreParameters),
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
        ("testItAddsTheNoVerifyParameterIfGitHookFolderIsPresent", testItAddsTheNoVerifyParameterIfGitHookFolderIsPresent),
        ("testItSendsTheCorrectScriptContent", testItSendsTheCorrectScriptContent),
        ("testItSendsTheNoVerifyParameterIfRequired", testItSendsTheNoVerifyParameterIfRequired),
        ("testItUsesAWorkaroundToGenerateTheTestsOnLinux", testItUsesAWorkaroundToGenerateTheTestsOnLinux),
    ]
}

extension RocketFileFinderTests {
    static let __allTests = [
        ("testItReturnsNilIfThereAreNoArgumentsAndTheDefaultFileDoesntExist", testItReturnsNilIfThereAreNoArgumentsAndTheDefaultFileDoesntExist),
        ("testItReturnsTheArgumentPathIfPresent", testItReturnsTheArgumentPathIfPresent),
        ("testItReturnsTheDefaultPathIfNoArgsAreThereAndTheFileExists", testItReturnsTheDefaultPathIfNoArgsAreThereAndTheFileExists),
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
        ("testItCreatesAScriptStepForNotRecognisedStrings", testItCreatesAScriptStepForNotRecognisedStrings),
        ("testItIgnoresTheInvalidSteps", testItIgnoresTheInvalidSteps),
        ("testItParsesCorrectlyAValidDictionary", testItParsesCorrectlyAValidDictionary),
        ("testItParsesCorrectlyBeforeAndAfterSteps", testItParsesCorrectlyBeforeAndAfterSteps),
        ("testItParsesCorrectlyWhenOnlyAfterIsSpecified", testItParsesCorrectlyWhenOnlyAfterIsSpecified),
        ("testItParsesCorrectlyWhenOnlyBeforeIsSpecified", testItParsesCorrectlyWhenOnlyBeforeIsSpecified),
    ]
}

extension SwiftScriptExecutorTests {
    static let __allTests = [
        ("testItCreatesTheCorrectProcess", testItCreatesTheCorrectProcess),
        ("testItDoesntCreateTheProcessIfThereIsNoScriptPath", testItDoesntCreateTheProcessIfThereIsNoScriptPath),
        ("testItPassesTheArgumentsToTheProcess", testItPassesTheArgumentsToTheProcess),
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

#if !os(macOS)
    public func __allTests() -> [XCTestCaseEntry] {
        return [
            testCase(CommitExecutorTests.__allTests),
            testCase(DefaultExecutorStepDescriptionTests.__allTests),
            testCase(DevDependenciesModifierTests.__allTests),
            testCase(GitAddExecutorTests.__allTests),
            testCase(HideDevDependenciesExecutorTests.__allTests),
            testCase(PushExecutorTests.__allTests),
            testCase(RocketFileFinderTests.__allTests),
            testCase(ScriptExecutorTests.__allTests),
            testCase(ScriptLauncherTestCase.__allTests),
            testCase(StepsParserTests.__allTests),
            testCase(SwiftScriptExecutorTests.__allTests),
            testCase(TagExecutorTests.__allTests),
            testCase(UnhideDevDependenciesExecutorTests.__allTests),
        ]
    }
#endif
