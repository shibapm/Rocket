
struct PushParameters: StepParameters {
    let remote: String
    let branch: String
    let noVerify: Bool?

    enum CodingKeys: String {
        case remote
        case branch
        case noVerify = "no_verify"
    }

    init(dictionary: [String: Any]?) {
        remote = dictionary?[CodingKeys.remote] ?? "origin"
        branch = dictionary?[CodingKeys.branch] ?? "master"
        noVerify = dictionary?[CodingKeys.noVerify]
    }
}
