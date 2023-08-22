import BaseFeature
import XCTest
import InputSchoolLifeInfoFeatureInterface
@testable import InputSchoolLifeInfoFeature

final class DummyInputSchoolLifeDelegate: InputSchoolLifeDelegate {
    func schoolLifePrevButtonDidTap() {}
    func completeToInputSchoolLife(input: InputSchoolLifeInfoFeatureInterface.InputSchoolLifeInformationObject) {}
}

final class InputSchoolLifeInfoFeatureTests: XCTestCase {
    var sut: MVIContainer<InputSchoolLifeInfoIntentProtocol, InputSchoolLifeInfoStateProtocol>!

    override func setUp() {
        let model = InputSchoolLifeInfoModel()
        let intent = InputSchoolLifeInfoIntent(
            model: model,
            inputSchoolLifeDelegate: DummyInputSchoolLifeDelegate()
        )
        sut = MVIContainer(
            intent: intent as InputSchoolLifeInfoIntentProtocol,
            model: model as InputSchoolLifeInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
    }

    func test_update_authentication_score() {
        sut.intent.updateAuthenticationScore(score: "2")
        XCTAssertEqual(sut.model.authenticationScore, "2")

        sut.intent.updateAuthenticationScore(score: "123")
        XCTAssertEqual(sut.model.authenticationScore, "123")

        sut.intent.updateAuthenticationScore(score: "ASDF")
        XCTAssertNotEqual(sut.model.authenticationScore, "ASDF")

        sut.intent.updateAuthenticationScore(score: "CXZ")
        XCTAssertNotEqual(sut.model.authenticationScore, "CXZ")

        let randomScore = Int.random(in: 0...100)
        sut.intent.updateAuthenticationScore(score: "\(randomScore)")
        XCTAssertEqual(sut.model.authenticationScore, "\(randomScore)")
    }
}
