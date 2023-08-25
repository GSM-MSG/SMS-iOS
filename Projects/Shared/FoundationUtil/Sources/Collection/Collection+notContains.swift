import Foundation

public extension Collection where Element: Equatable {
    func notContains(_ element: Element) -> Bool { !contains(element) }
}
