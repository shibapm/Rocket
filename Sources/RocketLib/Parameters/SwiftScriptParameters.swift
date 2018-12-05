
struct SwiftScriptParameters: StepParameters {
    let scriptPath: String?

    enum CodingKeys: String {
        case scriptPath = "script_path"
    }

    init(dictionary: [String: Any]?) {
        scriptPath = dictionary?[CodingKeys.scriptPath]
    }
}
