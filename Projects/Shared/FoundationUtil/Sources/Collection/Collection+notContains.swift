import Foundation

public extension Collection {
    func notContains(where predicate: (Element) -> Bool) -> Bool {
        return !self.contains { predicate($0) }
    }
}
