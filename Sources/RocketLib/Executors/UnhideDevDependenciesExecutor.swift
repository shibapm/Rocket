import Logger

final class UnhideDevDependenciesExecutor: DefaultExecutor<ModifyDevDependenciesParameters> {
    var devDependenciesModifier: DevDependenciesModifing = DevDependenciesModifier()
    
    override func executeStep(version: String, logger: Logger) {
        do {
            try devDependenciesModifier.unhideDependencies(packagePath: parameters.packagePath)
        } catch {
            logger.logError("Hide dev dependencies step failed with error", error)
        }
    }
}
