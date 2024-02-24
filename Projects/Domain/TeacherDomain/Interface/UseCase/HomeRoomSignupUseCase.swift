import Foundation

public protocol HomeRoomSignupUseCase {
    func execute(grade: Int, classNum: Int) async throws
}
