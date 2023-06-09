import Foundation

public struct FetchStudentListRequestDTO {
    public let page: Int
    public let size: Int
    
    public init(page: Int, size: Int) {
        self.page = page
        self.size = size
    }
}
