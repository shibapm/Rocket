
struct SwiftScriptParameters: StepParameters {
    let scriptPath: String?
    let arguments: [String]

    enum CodingKeys: String {
        case scriptPath = "script_path"
        case arguments
    }

    init(dictionary: [String: Any]?) {
        scriptPath = dictionary?[CodingKeys.scriptPath]
        arguments = dictionary?[CodingKeys.arguments] ?? []
    }
}
