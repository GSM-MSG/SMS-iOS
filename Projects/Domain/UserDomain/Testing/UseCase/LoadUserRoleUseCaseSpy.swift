import UserDomainInterface

public final class LoadUserRoleUseCaseSpy: LoadUserRoleUseCase {
    public var executeCallCount = 0
    private let returnRoleType: UserRoleType

    public init(role: UserRoleType = .student) {
        self.returnRoleType = role
    }

    public func execute() -> UserRoleType {
        executeCallCount += 1
        return returnRoleType
    }
}
