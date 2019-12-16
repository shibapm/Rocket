public protocol Check {
    init()
    
    var errorMessage: String { get }
    
    func check() -> Bool
}
