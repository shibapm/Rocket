
struct ScriptParameters {
    let content: String?
    
    enum CodingKeys: String {
        case content
    }
    
    init(dictionary: [String:Any]?) {
        self.content = dictionary?[CodingKeys.content]
    }
}
