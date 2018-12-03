
struct PushParameters: StepParameters {
    let remote: String
    let branch: String

    enum CodingKeys: String {
        case remote
        case branch
    }

    init(dictionary: [String: Any]?) {
        remote = dictionary?[CodingKeys.remote] ?? "origin"
        branch = dictionary?[CodingKeys.branch] ?? "master"
    }
}
