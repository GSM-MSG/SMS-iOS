import Foundation

public actor Debouncer {
    private let dueTime: TimeInterval
    private var task: Task<Void, Never>?

    public init(for dueTime: TimeInterval) {
        self.dueTime = dueTime
        
    }

    public nonisolated func callAsFunction(action: @escaping () async -> Void) {
        Task {
            await execute(action: action)
        }
    }

    public func execute(action: @escaping () async -> Void) {
        task?.cancel()
        self.task = Task {
            do {
                try await Task.sleep(nanoseconds: UInt64(dueTime) * 1_000_000_000)
                guard task?.isCancelled == false else { return }
                await action()
            } catch {
                return
            }
        }
    }
}
