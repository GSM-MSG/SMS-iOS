import Foundation

public protocol FetchMyProfileUseCase {
    func execute() async throws -> MyPageEntity
}
