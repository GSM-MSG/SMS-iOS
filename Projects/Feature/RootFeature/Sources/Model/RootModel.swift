import Foundation

final class RootModel: ObservableObject, RootStateProtocol {
    @Published var sceneType: RootSceneType = .inputInformation
}

extension RootModel: RootActionProtocol {
    func updateSceneType(type: RootSceneType) {
        self.sceneType = type
    }
}
