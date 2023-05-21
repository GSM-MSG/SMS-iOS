public protocol ValidatorType {
    associatedtype WrappedType

    func validate(_ value: WrappedType) -> Bool
}
