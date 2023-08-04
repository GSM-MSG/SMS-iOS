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
            ]
        )
    }

    func execute() async throws -> MyPageEntity {
        executeCallCount += 1
        return try await executeHandler()
    }

}
