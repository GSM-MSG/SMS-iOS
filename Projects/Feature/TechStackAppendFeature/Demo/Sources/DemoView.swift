import BaseFeature
import DesignSystem
import SwiftUI
@testable import TechStackAppendFeature

public struct DemoView: View {
    public var body: some View {
        VStack {
            let model = TechStackAppendModel()
            let intent = TechStackAppendIntent(model: model)
            let container = MVIContainer(
                intent: intent as TechStackAppendIntentProtocol,
                model: model as TechStackAppendStateProtocol,
                modelChangePublisher: model.objectWillChange
            )
            TechStackAppendView(container: container)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DemoView()
        }
    }
}
