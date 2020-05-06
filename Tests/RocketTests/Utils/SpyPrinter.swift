import Logger

final class SpyPrinter: Printing {
    var receivedMessages: [String] = []

    func print(_ message: String, terminator _: String) {
        receivedMessages.append(message)
    }
}

extension Logger {
    static var testLogger: Logger {
        Logger(printer: SpyPrinter())
    }
}
