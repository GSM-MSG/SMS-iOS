import Foundation

public final class Throttler {
    private let latest: Bool
    private let dueTime: UInt64
    private var task: Task<Void, Never>?
    private var action: (() async -> Void)?
    private var isInitial = true

    public init(for dueTime: TimeInterval, latest: Bool = true) {
        self.dueTime = UInt64(dueTime * 1_000_000_000)
        self.latest = latest
    }

    public func callAsFunction(
        action: @escaping () async -> Void
    ) {
        execute(action: action)
    }

    private func execute(
        action: @escaping () async -> Void
    ) {
        if latest {
            self.action = action
        }
        guard task?.isCancelled ?? true else { return }

        Task {
            await action()
            self.action = nil
        }

        self.task = Task { [weak self] in
            guard let self else { return }
            try? await Task.sleep(nanoseconds: dueTime)
            self.task?.cancel()
            self.task = nil

            if latest, let action = self.action {
                await action()
                self.action = nil
            }
        }
    }
}
