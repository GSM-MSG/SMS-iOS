import Foundation

public struct StringSizeValidator: Validator {
    private let min: Int
    private let max: Int

    public init(min: Int = .zero, max: Int = .max) {
        self.min = min
        self.max = max
    }

    public func validate(_ value: String) -> Bool {
        value.count >= min && value.count <= max
    }
}
