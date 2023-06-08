import SwiftUI

@main
struct TechStackAppendDemoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                DemoView()
            }
            .navigationViewStyle(.stack)
        }
    }
}
