import BaseFeature
import InputProfileInfoFeatureInterface
import XCTest
@testable import InputProfileInfoFeature
@testable import MajorDomainTesting

final class DummyInputProfileDelegate: InputProfileDelegate {
    func completeToInputProfile(input: InputProfileInformationObject) {}
}

@MainActor
final class InputProfileInfoFeatureTests: XCTestCase {
    var model: InputProfileInfoModel!
    var fetchMajorListUseCaseSpy: FetchMajorListUseCaseSpy!
    var intent: InputProfileInfoIntent!
    var sut: MVIContainer<InputProfileInfoIntentProtocol, InputProfileInfoStateProtocol>!

    override func setUp() async throws {
        model = InputProfileInfoModel()
        fetchMajorListUseCaseSpy = FetchMajorListUseCaseSpy()
        intent = InputProfileInfoIntent(
            model: model,
            inputProfileDelegate: DummyInputProfileDelegate(),
            fetchMajorListUseCase: fetchMajorListUseCaseSpy
        )
        sut = MVIContainer(
            intent: intent as InputProfileInfoIntentProtocol,
            model: model as InputProfileInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
    }

    func test_on_load() async throws {
        sut.intent.onLoad()
        try await Task.sleep(nanoseconds: 1_000_000_000)
        XCTAssertEqual(sut.model.majorList, ["A", "B", "C"])
        XCTAssertEqual(fetchMajorListUseCaseSpy.executeCallCount, 1)
    }

    func test_update_introduce() {
        sut.intent.updateIntroduce(introduce: "A")
        XCTAssertEqual(sut.model.introduce, "A")

        let uuid = UUID().uuidString
        sut.intent.updateIntroduce(introduce: uuid)
        XCTAssertEqual(sut.model.introduce, uuid)
    }

    func test_update_email() {
        sut.intent.updateEmail(email: "A")
        XCTAssertEqual(sut.model.email, "A")

        let uuid = UUID().uuidString
        sut.intent.updateEmail(email: uuid)
        XCTAssertEqual(sut.model.email, uuid)
    }

    func test_update_major() {
        sut.intent.updateMajor(major: "A")
        XCTAssertEqual(sut.model.major, "A")

        let uuid = UUID().uuidString
        sut.intent.updateMajor(major: uuid)
        XCTAssertEqual(sut.model.major, uuid)
    }

    func test_update_portfoiloURL() {
        sut.intent.updatePortfolioURL(portfolioURL: "A")
        XCTAssertEqual(sut.model.portfolioURL, "A")

        let uuid = UUID().uuidString
        sut.intent.updatePortfolioURL(portfolioURL: uuid)
        XCTAssertEqual(sut.model.portfolioURL, uuid)
    }

    func test_bottomSheet_intet() async throws {
        sut.intent.majorSheetIsRequired()
        XCTAssertEqual(sut.model.isPresentedMajorSheet, true)

        sut.intent.majorSheetDismissed()
        try await Task.sleep(nanoseconds: 100_000_000)
        XCTAssertEqual(sut.model.isPresentedMajorSheet, false)
    }
}
