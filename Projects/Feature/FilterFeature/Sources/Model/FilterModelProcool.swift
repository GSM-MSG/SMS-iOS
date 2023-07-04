import UserDomainInterface

protocol FilterStateProtocol {
    var isError: Bool { get }
    var isLoading: Bool { get }
    var isPresentedTechStackAppend: Bool { get }
    var userRole: UserRoleType { get }
    var techStacks: [String] { get }
}

protocol FilterActionProtocol: AnyObject {
    func updateIsError(isError: Bool)
    func updateIsLoading(isLoading: Bool)
    func updateUserRole(role: UserRoleType)
    func updateIsPresentedTeckStackAppend(isPresented: Bool)
    func updateTeckStacks(techStacks: [String])
}
