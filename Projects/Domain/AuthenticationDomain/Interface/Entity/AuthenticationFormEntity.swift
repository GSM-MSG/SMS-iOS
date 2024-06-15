import Foundation

public struct AuthenticationFormEntity {
    public let files: [File]
    public let areas: [Area]

    public init(files: [File], areas: [Area]) {
        self.files = files
        self.areas = areas
    }
}

extension AuthenticationFormEntity {
    public struct Area {
        public let title: String
        public let sections: [SectionEntity]
        public init(title: String, sections: [SectionEntity]) {
            self.title = title
            self.sections = sections
        }
    }

    public struct File {
        public let name: String
        public let url: String
        public init(name: String, url: String) {
            self.name = name
            self.url = url
        }
    }
}
