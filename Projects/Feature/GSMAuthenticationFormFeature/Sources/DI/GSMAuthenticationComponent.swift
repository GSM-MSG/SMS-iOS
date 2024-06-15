import BaseFeature
import Foundation
import NeedleFoundation
import SwiftUI
import GSMAuthenticationFormFeatureInterface
import AuthenticationDomainInterface

public protocol GSMAuthenticationDependency: Dependency {
    var authenticationDomainBuildable: any AuthenticationDomainBuildable { get }
}

public final class GSMAuthenticationComponent: Component<GSMAuthenticationDependency>, GSMAuthenticationBuildable {
    public func makeView() -> some View {
        let model = GSMAuthenticationFormModel()
        let intent = GSMAuthenticationFormIntent(
            model: model,
            fetchAuthenticationFormUseCase: dependency.authenticationDomainBuildable.fetchAuthenticationFormUseCase,
            inputAuthenticationUseCase: dependency.authenticationDomainBuildable.inputAuthenticationUseCase
        )
        let container = MVIContainer(
            intent: intent as GSMAuthenticationFormIntentProtocol,
            model: model as GSMAuthenticationFormStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return GSMAuthenticationFormView(
            container: container
        )
    }
}
