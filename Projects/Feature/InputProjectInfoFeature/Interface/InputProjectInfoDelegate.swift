import Foundation
import StudentDomainInterface
import DateUtil

public protocol InputProjectInfoDelegate: AnyObject {
    func projectInfoPrevButtonDidTap()
    func completeToInputProjectInfo(input: [InputProjectInfoObject])
}

public struct InputProjectInfoObject {
    public let name: String
    public let iconImage: ImageFile?
    public let previewImages: [ImageFile]
    public let content: String
    public let techStacks: [String]
    public let mainTask: String
    public let startAt: Date
    public let endAt: Date?
    public let relatedLinks: [RelatedLink]

    public init(
        name: String,
        iconImage: ImageFile?,
        previewImages: [ImageFile],
        content: String,
        techStacks: [String],
        mainTask: String,
        startAt: Date,
        endAt: Date?,
        relatedLinks: [RelatedLink]
    ) {
        self.name = name
        self.iconImage = iconImage
        self.previewImages = previewImages
        self.content = content
        self.techStacks = techStacks
        self.mainTask = mainTask
        self.startAt = startAt
        self.endAt = endAt
        self.relatedLinks = relatedLinks
    }
}

public extension InputProjectInfoObject {
    var startAtString: String {
        startAt.toStringCustomFormat(format: "yyyy.MM")
    }
    var endAtString: String {
        endAt?.toStringCustomFormat(format: "yyyy.MM") ?? ""
    }

    func toDTO() -> InputStudentInformationRequestDTO.Project {
        InputStudentInformationRequestDTO.Project(
            name: name,
            iconImageURL: iconImage?.url ?? "",
            previewImageURLs: previewImages.map { $0.previewImageUrl ?? "" },
            description: content,
            links: relatedLinks.map { $0.toDTO() },
            techStacks: techStacks,
            myActivity: mainTask,
            inProgress: InputStudentInformationRequestDTO.Project.InProgress(
                start: startAtString,
                end: endAtString
            )
        )
    }
}

public extension InputProjectInfoObject {
    struct ImageFile {
        public let name: String
        public let url: String?
        public let previewImageUrl: String?
        public let data: Data

        public init(name: String, url: String? = .init(), previewImageUrl: String? = .init(), data: Data) {
            self.name = name
            self.url = url
            self.previewImageUrl = previewImageUrl
            self.data = data
        }
    }

    struct RelatedLink {
        public let name: String
        public let url: String

        public init(name: String, url: String) {
            self.name = name
            self.url = url
        }
    }
}

extension InputProjectInfoObject.RelatedLink {
    func toDTO() -> InputStudentInformationRequestDTO.Project.Link {
        InputStudentInformationRequestDTO.Project.Link(
            name: name,
            url: url
        )
    }
}
