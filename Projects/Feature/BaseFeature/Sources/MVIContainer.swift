import Combine
import SwiftUI

public final class MVIContainer<Intent, Model>: ObservableObject {
    private let intent: Intent
    @Published private var model: Model

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
