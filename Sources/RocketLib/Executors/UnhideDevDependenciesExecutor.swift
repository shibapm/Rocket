import Logger

final class UnhideDevDependenciesExecutor: DefaultExecutor<ModifyDevDependenciesParameters> {
    var devDependenciesModifier: DevDependenciesModifing = DevDependenciesModifier()

    func executeStep(version _: String, logger: Logger) {
        do {
            try devDependenciesModifier.unhideDependencies(packagePath: parameters.packagePath)
        } catch {
            logger.logError("Hide dev dependencies step failed with error", error)
        }
    }
}
