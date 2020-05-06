protocol DevDependenciesModifing {
    func hideDependencies(packagePath: String) throws
    func unhideDependencies(packagePath: String) throws
}

struct DevDependenciesModifier: DevDependenciesModifing {
    private let commentString = "//"

    private enum Action {
        case hide
        case unhide
    }

    func hideDependencies(packagePath: String) throws {
        try modifyDevDependencies(packagePath: packagePath, action: .hide)
    }

    func unhideDependencies(packagePath: String) throws {
        try modifyDevDependencies(packagePath: packagePath, action: .unhide)
    }

    private func modifyDevDependencies(packagePath: String, action: Action) throws {
        let packageContent = try String(contentsOfFile: packagePath)
        let lines = packageContent.components(separatedBy: .newlines)

        var result = packageContent

        lines.forEach { line in
            if isDevDependencyLine(line: line) {
                switch action {
                case .hide:
                    result = result.replacingOccurrences(of: line, with: hideDependencyOnLine(line))
                case .unhide:
                    if line.hasPrefix(commentString) {
                        result = result.replacingOccurrences(of: line, with: unhideDependencyOnLine(line))
                    }
                }
            }
        }

        try result.write(toFile: packagePath, atomically: true, encoding: .utf8)
    }

    private func hideDependencyOnLine(_ line: String) -> String {
        commentString + line
    }

    private func unhideDependencyOnLine(_ line: String) -> String {
        String(line[String.Index(utf16Offset: 2, in: line) ..< line.endIndex])
    }

    private func isDevDependencyLine(line: String) -> Bool {
        line.contains("// dev") || line.contains("//dev")
    }
}
