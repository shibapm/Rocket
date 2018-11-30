
struct GitAddParameters: StepParameters {
    let paths: [String]?
    
    enum CodingKeys: String {
        case paths
    }
    
    init(dictionary: [String:Any]?) {
        self.paths = dictionary?[CodingKeys.paths]
    }
}
