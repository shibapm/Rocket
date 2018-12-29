import Logger

public final class StepDescriptionPrinter {
    public init() {}

    enum PrintType {
        case start
        case end
    }

    func printStepDescription<T: StepParameters>(forDefaultExecutor executor: DefaultExecutor<T>, logger: Logger, type: PrintType) {
        let parametersString = Mirror(reflecting: executor.parameters).children.compactMap { parameterString(fromChild: $0) }.joined(separator: " ")

        let stepDescription = executor.step.rawValue + (parametersString.count > 0 ? " (\(parametersString))" : "")

        switch type {
        case .start:
            logger.logInfo("- " + stepDescription, terminator: "")
        case .end:
            logger.logInfo("\r", terminator: "")
            logger.logSuccess(stepDescription)
        }
    }

    private func parameterString(fromChild child: Mirror.Child) -> String? {
        let valueString: String?

        if let value = child.value as? OptionalProtocol {
            valueString = value.unwappedDescription
        } else {
            valueString = String(describing: child.value)
        }

        if let valueString = valueString {
            return "\(child.label ?? "")=\(valueString)"
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
