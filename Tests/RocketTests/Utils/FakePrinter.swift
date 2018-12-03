import Logger

struct FakePrinter: Printing {
    func print(_: String, terminator _: String) {}
}

extension Logger {
    static var testLogger: Logger {
        return Logger(printer: FakePrinter())
    }
}
