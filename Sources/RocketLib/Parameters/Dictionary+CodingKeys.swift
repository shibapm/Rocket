import Foundation

extension Dictionary {
    subscript<T: RawRepresentable, R>(rawRappresentable: T) -> R? where T.RawValue == Key {
        self[rawRappresentable.rawValue] as? R
    }
}
