
struct ModifyDevDependenciesParameters: StepParameters {
    var packagePath: String

    enum CodingKeys: String {
        case packagePath = "package_path"
    }

    init(dictionary: [String: Any]?) {
        packagePath = dictionary?[CodingKeys.packagePath] ?? "Package.swift"
    }
}
