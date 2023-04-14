import Foundation

public extension String {
    func toISODate(
        options: ISO8601DateFormatter.Options = [
            .withFullDate,
            .withTime,
            .withDashSeparatorInDate,
            .withColonSeparatorInTime,
        ]
    ) -> Date {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = options
        return formatter.date(from: self) ?? .init()
    }

    func toDateCustomFormat(format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self) ?? .init()
    }
}

public extension Date {
    func toISOString(
        options: ISO8601DateFormatter.Options = [
            .withFullDate,
            .withTime,
            .withDashSeparatorInDate,
            .withColonSeparatorInTime
        ]
    ) -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = options
        return formatter.string(from: self)
    }

    func toStringCustomFormat(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
