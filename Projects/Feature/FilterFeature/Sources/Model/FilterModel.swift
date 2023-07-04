import Foundation
import UserDomainInterface

final class FilterModel: ObservableObject, FilterStateProtocol {
    @Published var userRole: UserRoleType = .guest
    @Published var isError: Bool = false
    @Published var isPresentedTechStackAppend: Bool = false
    @Published var techStacks: [String] = []
    @Published var isLoading: Bool = false
}

extension FilterModel: FilterActionProtocol {
    func updateIsError(isError: Bool) {
        self.isError = isError
    }

    func updateIsPresentedTeckStackAppend(isPresented: Bool) {
        self.isPresentedTechStackAppend = isPresented
    }

    func updateTeckStacks(techStacks: [String]) {
        self.techStacks = techStacks
    }

    func updateIsLoading(isLoading: Bool) {
        self.isLoading = isLoading
    }

    func updateUserRole(role: UserRoleType) {
        self.userRole = role
    }
}
