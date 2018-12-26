import Logger

public final class StepDescriptionPrinter {
    public init() {}
    private let separator = "=============================================="

    func printStepDescription<T: StepParameters>(forDefaultExecutor executor: DefaultExecutor<T>, logger: Logger) {
        logger.logInfo("")
        printSeparator(logger: logger)
        logger.logInfo("")
        logger.logInfo("- Executing step:")
        logger.logInfo("")
        logger.logInfo(executor.step.rawValue)

        let parametersString = Mirror(reflecting: executor.parameters).children.compactMap { parameterString(fromChild: $0) }.joined(separator: "\n")

        if !parametersString.isEmpty {
            logger.logInfo("")
            logger.logInfo("")
            logger.logInfo("- Parameters:")
            logger.logInfo("")

            logger.logInfo(parametersString)
        }

        logger.logInfo("")
        printSeparator(logger: logger)
        logger.logInfo("")
    }

    private func printSeparator(logger: Logger) {
        logger.logInfo(separator)
    }

    private func parameterString(fromChild child: Mirror.Child) -> String? {
        let valueString: String?

        if let value = child.value as? OptionalProtocol {
            valueString = value.unwappedDescription
        } else {
            valueString = String(describing: child.value)
        }

        if let valueString = valueString {
            return "\(child.label ?? ""): \(valueString)"
        } else {
            return nil
        }
    }
}

private protocol OptionalProtocol {
    var unwappedDescription: String? { get }
}

extension Optional: OptionalProtocol {
    var unwappedDescription: String? {
        switch self {
        case .none:
            return nil
        case let .some(unwrapped):
            if let unwrapped = unwrapped as? CustomStringConvertible {
                return unwrapped.description
            } else {
                return String(describing: unwrapped)
            }
        }
    }
}
