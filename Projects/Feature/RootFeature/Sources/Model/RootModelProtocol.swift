import Foundation

protocol RootStateProtocol {
    var sceneType: RootSceneType { get }
}

protocol RootActionProtocol: AnyObject {}
