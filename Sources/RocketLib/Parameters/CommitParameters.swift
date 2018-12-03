
struct CommitParameters: StepParameters {
    let message: String?

    enum CodingKeys: String {
        case message
    }

    init(dictionary: [String: Any]?) {
        message = dictionary?[CodingKeys.message]
    }
}
