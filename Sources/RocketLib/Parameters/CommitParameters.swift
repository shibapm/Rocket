
struct CommitParameters: StepParameters {
    let message: String?
    
    enum CodingKeys: String {
        case message
    }
    
    init(dictionary: [String:Any]?) {
        self.message = dictionary?[CodingKeys.message]
    }
}
