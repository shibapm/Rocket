import Logger

final class HideDevDependenciesExecutor: DefaultExecutor<ModifyDevDependenciesParameters> {
    var devDependenciesModifier: DevDependenciesModifing = DevDependenciesModifier()

    override func executeStep(version _: String, logger: Logger) {
        do {
            try devDependenciesModifier.hideDependencies(packagePath: parameters.packagePath)
        } catch {
            logger.logError("Hide dev dependencies step failed with error", error)
        }
    }
}
