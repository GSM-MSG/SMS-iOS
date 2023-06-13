import Foundation

public struct FetchTechStackListResponseDTO: Decodable {
    public let techStack: [String]

    public init(techStack: [String]) {
        self.techStack = techStack
    }
}
