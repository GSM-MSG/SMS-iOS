import Foundation

final class RootModel: ObservableObject, RootStateProtocol {
    @Published var sceneType: RootSceneType = .inputInformation
}

extension RootModel: RootActionProtocol {}
