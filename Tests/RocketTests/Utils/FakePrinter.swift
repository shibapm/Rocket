import Logger

struct FakePrinter: Printing {
    func print(_ message: String, terminator: String) {
    }
}

extension Logger {
    static var testLogger: Logger {
        return Logger(printer: FakePrinter())
    }
}
