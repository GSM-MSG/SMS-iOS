import BaseFeature
import InputProfileInfoFeatureInterface
import XCTest
@testable import InputProfileInfoFeature

final class InputProfileInfoFeatureTests: XCTestCase {
    var model: InputProfileInfoModel!
    var intent: InputProfileInfoIntent!
    var sut: MVIContainer<InputProfileInfoIntentProtocol, InputProfileInfoStateProtocol>!
             
    override func setUp() async throws {
        model = InputProfileInfoModel()
        intent = InputProfileInfoIntent(model: model)
        sut = MVIContainer(
            intent: intent as InputProfileInfoIntentProtocol,
            model: model as InputProfileInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
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
        sut.intent.updatePortfoiloURL(portfoiloURL: "A")
        XCTAssertEqual(sut.model.portfoiloURL, "A")

        let uuid = UUID().uuidString
        sut.intent.updatePortfoiloURL(portfoiloURL: uuid)
        XCTAssertEqual(sut.model.portfoiloURL, uuid)
    }

    func test_update_techStack() {
        sut.intent.updateTechStack(techStack: "A")
        XCTAssertEqual(sut.model.techStack, "A")

        let uuid = UUID().uuidString
        sut.intent.updateTechStack(techStack: uuid)
        XCTAssertEqual(sut.model.techStack, uuid)
    }

    func test_bottomSheet_intet() {
        sut.intent.majorSheetIsRequired()
        XCTAssertEqual(sut.model.isPresentedMajorSheet, true)

        sut.intent.majorSheetDismissed()
        XCTAssertEqual(sut.model.isPresentedMajorSheet, false)
    }
}
