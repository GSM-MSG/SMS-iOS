import UserDomainInterface

final class FetchMyProfileUseCaseSpy: FetchMyProfileUseCase {
    var executeCallCount = 0
    var executeHandler: () async throws -> MyPageEntity = {
        .init(
            name: "name",
            introduce: "intro",
            portfolioURL: "https://github.com/baekteun",
            grade: 3,
            classNum: 2,
            number: 18,
            department: .software,
            major: "iOS",
            profileImageURL: "https://avatars.githubusercontent.com/u/74440939?v=4",
            contactEmail: "baegteun@gmail.com",
            gsmAuthenticationScore: 990,
            formOfEmployment: .fullTime,
            regions: ["Seoul"],
            militaryService: .hope,
            salary: 9999,
            languageCertificates: [
                .init(name: "한국어", score: "원어민")
            ],
            certificates: [
                "정보처리산업기사"
            ],
            techStacks: [
                "Swift",
                "Tuist",
                "MicroFeatures"
            ],
            projects: [
                .init(
                    name: "asdf",
                    iconImageURL: "https://avatars.githubusercontent.com/u/74440939?v=4",
                    previewImageURLs: [
                        "https://avatars.githubusercontent.com/u/74440939?v=4"
                    ],
                    description: "최형우다",
                    links: [
                        .init(
                            name: "와우",
                            url: "https://www.github.com"
                        )
                    ],
                    techStacks: [
                        "iOS"
                    ],
                    myActivity: "나는 짱이다",
                    inProgress: .init(start: "", end: "")
                )
            ],
            prizes: [
                .init(name: "1234", type: "와우", date: "2023.12.11")
            ]
        )
    }

    func execute() async throws -> MyPageEntity {
        executeCallCount += 1
        return try await executeHandler()
    }

}
