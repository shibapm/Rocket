struct ScriptParameters: StepParameters {
    let content: String?

    enum CodingKeys: String {
        case content
    }

    init(dictionary: [String: Any]?) {
        content = dictionary?[CodingKeys.content]
    }
}
