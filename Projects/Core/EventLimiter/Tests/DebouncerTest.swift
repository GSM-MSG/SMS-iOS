import XCTest
import EventLimiter

final class DebouncerTests: XCTestCase {
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testExample() async {
        let throttler = Throttler(for: 1, latest: false)

        throttler {
            print("ASDf")
        }
        throttler {
            print("ASDf2")
        }

        try? await Task.sleep(nanoseconds: 500_000_000)
        throttler {
            print("ASDf3")
        }

        try? await Task.sleep(nanoseconds: 600_000_000)
        throttler {
            print("ASDf4")
        }

        try? await Task.sleep(nanoseconds: 200_000_000)
        throttler {
            print("ASDf5")
        }

        try? await Task.sleep(nanoseconds: 300_000_000)
        throttler {
            print("ASDf6")
        }
        throttler {
            print("ASDf7")
        }

        try? await Task.sleep(nanoseconds: 5_000_000_000)
    }
}
