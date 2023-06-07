import BaseFeature
import DesignSystem
import SwiftUI
@testable import TechStackAppendFeature

public struct DemoView: View {
    public var body: some View {
        VStack {
            let model = TechStackAppendModel()
            let intent = TechStackAppendIntent()
            let container = MVIContainer(
                intent: intent as TechStackAppendIntentProtocol,
                model: model as TechStackAppendStateProtocol,
                modelChangePublisher: model.objectWillChange
            )
            TechStackAppendView(container: container)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    SMSIconTextField("placeholder", text: .constant("")) {
                        SMSIcon(.trash)
                    }
                }
            }
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DemoView()
        }
    }
}
