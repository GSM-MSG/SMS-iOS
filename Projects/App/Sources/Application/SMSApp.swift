import BaseFeature
import DesignSystem
import SwiftUI

@main
struct SMSApp: App {
    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().signinComponent.makeView()
        }
    }
}
