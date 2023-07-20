import Foundation
import UserDomainInterface

final class MyPageIntent:MyPageIntentProtocol {
    private weak var model: (any MyPageActionProtocol)?
    private let fetchMyProfileUseCase: any FetchMyProfileUseCase

    init(
        model: any MyPageActionProtocol,
        fetchMyProfileUseCase: any FetchMyProfileUseCase
    ) {
        self.model = model
        self.fetchMyProfileUseCase = fetchMyProfileUseCase
    }
}
