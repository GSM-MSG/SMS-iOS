import Foundation

public final class Debouncer {
    private let delay: TimeInterval
    private let queue: DispatchQueue
    private var workItem: DispatchWorkItem?

    public init(
        delay: TimeInterval,
        queue: DispatchQueue = DispatchQueue.main
    ) {
        self.delay = delay
        self.queue = queue
    }

    public func debounce(action: @escaping () -> Void) {
        workItem?.cancel()
        workItem = DispatchWorkItem { [weak self] in
            action()
            self?.workItem = nil
        }
        if let workItem {
            queue.asyncAfter(deadline: .now() + delay, execute: workItem)
        }
    }
}
