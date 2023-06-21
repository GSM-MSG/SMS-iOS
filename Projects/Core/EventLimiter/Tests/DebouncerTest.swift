import XCTest
import EventLimiter

final class DebouncerTests: XCTestCase {
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testExample() async {
        let debouncer = Debouncer(for: 1)

        debouncer {
            print("ASDf")
        }
        debouncer {
            print("ASDf2")
        }

        try? await Task.sleep(nanoseconds: 1_000_000_000)
        debouncer {
            print("ASDf3")
        }

        try? await Task.sleep(nanoseconds: 600_000_000)
        debouncer {
            print("ASDf4")
        }

        try? await Task.sleep(nanoseconds: 200_000_000)
        debouncer {
            print("ASDf5")
        }

        try? await Task.sleep(nanoseconds: 400_000_000)
        debouncer {
            print("ASDf6")
        }
        debouncer {
            print("ASDf7")
        }

        try? await Task.sleep(nanoseconds: 2_000_000_000)

        debouncer {
            print("ASDf8")
        }

        try? await Task.sleep(nanoseconds: 2_000_000_000)
    }
}
