import Foundation

public struct FetchTechStackListResponseDTO: Decodable {
    public let techStacks: [String]

    public init(techStacks: [String]) {
        self.techStacks = techStacks
    }
}
