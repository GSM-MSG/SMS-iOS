import BaseFeature
import DesignSystem
import SwiftUI

@main
struct SMSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
        }
    }
}
