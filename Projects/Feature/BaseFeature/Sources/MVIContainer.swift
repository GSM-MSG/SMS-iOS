import Combine
import SwiftUI

public final class MVIContainer<Intent, Model>: ObservableObject {
    public let intent: Intent
    @Published public var model: Model

    private var bag = Set<AnyCancellable>()

    public init(intent: Intent, model: Model, modelChangePublisher: ObjectWillChangePublisher) {
        self.intent = intent
        self.model = model

        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: self.objectWillChange.send)
            .store(in: &bag)
    }
}
