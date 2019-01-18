struct BranchParameters: StepParameters {
    let name: String

    enum CodingKeys: String {
        case name
    }

    init(dictionary: [String: Any]?) {
        name = dictionary?[CodingKeys.name] ?? "master"
    }
}
