import BaseFeature
import XCTest
import InputSchoolLifeInfoFeatureInterface
@testable import InputSchoolLifeInfoFeature

final class DummyInputSchoolLifeDelegate: InputSchoolLifeDelegate {
    func schoolLifePrevButtonDidTap() {}
    func completeToInputSchoolLife() {}
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
        // TODO: - 숫자만 입력되는지 검사
        sut.intent.updateAuthenticationScore(score: "2")
        XCTAssertEqual(sut.model.authenticationScroe, "2")

        let randomScore = Int.random(in: 0...100)
        sut.intent.updateAuthenticationScore(score: "\(randomScore)")
        XCTAssertEqual(sut.model.authenticationScroe, "\(randomScore)")
    }

    func test_file_importer_sheet() {
        sut.intent.hwpFilImporterIsRequred()
        XCTAssertTrue(sut.model.isPresentedHWPFileImporter)

        sut.intent.hwpFilImporterIsRequred()
        XCTAssertFalse(sut.model.isPresentedHWPFileImporter)
    }
}
