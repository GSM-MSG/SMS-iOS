import Foundation

@available(*, unavailable, message: "아직 구현되지 않은 객체입니다.")
public actor Throttler {
    private let dueTime: TimeInterval
    private var task: Task<Void, Never>?

    public init(for dueTime: TimeInterval) {
        self.dueTime = dueTime
    }

    public nonisolated func callAsFunction(
        latest: Bool = true,
        action: @escaping () async -> Void
    ) {
        Task {
            await execute(latest: latest, action: action)
        }
    }

    public func execute(
        latest: Bool = true,
        action: @escaping () async -> Void
    ) {
        guard task?.isCancelled ?? true else { return }

        Task {
            await action()
        }

        self.task = Task {
            try? await Task.sleep(nanoseconds: UInt64(dueTime) * 1_000_000_000)
            self.task?.cancel()
            self.task = nil
        }
    }
}
