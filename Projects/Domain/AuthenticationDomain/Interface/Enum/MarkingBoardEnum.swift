public enum MarkingBoardType: String, Codable {
    case notSubmitted = "NOT_SUBMITTED"
    case pendingReview = "PENDING_REVIEW"
    case underReview = "UNDER_REVIEW"
    case completed = "COMPLETED"
}
