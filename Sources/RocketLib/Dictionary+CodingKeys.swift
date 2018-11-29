import Foundation

extension Dictionary {
    subscript<T : RawRepresentable, R>(rawRappresentable: T) -> R? where T.RawValue == Key {
        return self[rawRappresentable.rawValue] as? R
    }
}
