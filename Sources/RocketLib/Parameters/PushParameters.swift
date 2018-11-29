
struct PushParameters {
    let remote: String?
    let branch: String?
    
    enum CodingKeys: String {
        case remote
        case branch
    }
    
    init(dictionary: [String:Any]?) {
        self.remote = dictionary?[CodingKeys.remote]
        self.branch = dictionary?[CodingKeys.branch]
    }
}
