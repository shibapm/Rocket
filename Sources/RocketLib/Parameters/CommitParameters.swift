
struct CommitParameters: StepParameters {
    let message: String?
    let noVerify: Bool

    enum CodingKeys: String {
        case message
        case noVerify = "no_verify"
    }

    init(dictionary: [String: Any]?) {
        message = dictionary?[CodingKeys.message]
        noVerify = dictionary?[CodingKeys.noVerify] ?? false
    }
}
