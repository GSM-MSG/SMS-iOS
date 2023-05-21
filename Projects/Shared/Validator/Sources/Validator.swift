public protocol Validator {
    associatedtype WrappedType

    func validate(_ value: WrappedType) -> Bool
}
