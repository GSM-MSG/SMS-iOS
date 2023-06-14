import Foundation

public final class Debouncer {
    private let dueTime: UInt64
    private var task: Task<Void, Never>?

    public init(for dueTime: Double) {
        self.dueTime = UInt64(dueTime * 1_000_000_000)
    }

    public init(for dueTime: Int) {
        self.dueTime = UInt64(dueTime * 1_000_000_000)
    }

    public func callAsFunction(action: @escaping () async -> Void) {
        execute(action: action)
    }

    private func execute(action: @escaping () async -> Void) {
        task?.cancel()
        self.task = Task {
            do {
                try await Task.sleep(nanoseconds: dueTime)
                guard !Task.isCancelled else { return }
                await action()
            } catch {
                return
            }
        }
    }
}
